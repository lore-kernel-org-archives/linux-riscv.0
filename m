Return-Path: <SRS0=yhZS=QK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CE6C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 Feb 2019 11:53:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8779221773
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 Feb 2019 11:53:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V1XEANUH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lifcbF5M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8779221773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPfBdIE+B+zkqCOmXAasEgo6DvADoaru6IBiQxq4UEk=; b=V1XEANUHDs9cKu
	/aJFEYY3ZW0JukCjyIfAWgoxJ4ngvJuH3rNzu4Gx/2PfOBYfNVOvgEIzkWPhdFoimFWgY2Rneo3pz
	FqeUyyPBZulmI+4ss5FQysjMSDgdq6S1m60gDRWjEoEgxowoBUENGNHRh0Lyo8BNgKXW2G1SmNckz
	dKOBjbPRiPH2JDir4m4fwV4hjNVKuzqHdk2UZw7JR4tE1OmdddinDskDo9ZBsMowuXyVM3cdb485a
	rlSO16vi8hVLo9WGRf9ssGsHBpw20aEaHdLv4e9FzylkS3DqXplWBN5Qi13VVvsbnadjwqyHIy5mP
	cnX/bpHVZza3qcVR/9vA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqGKc-0007ts-5t; Sun, 03 Feb 2019 11:53:02 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqGKZ-0007rr-VD
 for linux-riscv@lists.infradead.org; Sun, 03 Feb 2019 11:53:01 +0000
Received: by mail-ed1-x542.google.com with SMTP id p6so9059753eds.0
 for <linux-riscv@lists.infradead.org>; Sun, 03 Feb 2019 03:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jGORwTYKZSs8e9AqRAHyYF0TKUYoUYDhjsmU7+h4s8E=;
 b=lifcbF5Mr4zWpfs4uyM0Rm5RA9/rZ5PjGYKZWzZtXqBYNiVNcQDDY51OzDvILYuOQ3
 tadiat/YPpBitDkexe1exNyOtlroJHoVOxYg3Y4fiKvYAmipfZ6C2PX1bSFezkTw8H/1
 mfGjTRzb+bzrjy2VRtwHBeZgMzdPcW1iY4f7YVwMVUzkMXKcX992GYWU4lU2ddBfTITg
 jkz9dNsecenk6+5QIS+Jf14MGLR64r822pupY9YTSxeXsJn0xqexQeo4TkYp4OFxPS1Q
 bOYge7kckx/kCYtqMXGwMJ7ns87uxKq9E/Wq+dOLOrV+BlOfxZtOOWC0P/R9281c+lI0
 3Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jGORwTYKZSs8e9AqRAHyYF0TKUYoUYDhjsmU7+h4s8E=;
 b=ivQn1AWXEuT9rFHG/bPR0ce55S5U55gU/4n44sARm0xq+TvVxH3K3nEryipBz1+VLt
 1JgsF9sM3Wl/LrHeo8Iwu5+xGmIk6B26k5oFgy7wGCGLIAQbl1BO99h/DgcSp+2+gE3p
 G7DoS8sm5xtHogXcQxc04EX9Zs0VZQBzMhtR0psz5V/pkTDEeh8qiwJb1QPWyUfKnR2A
 ThbrJ9P9mhZ/WDa+mExCen9kfzZ+mLkMUlyfz0+JbJdVPD9PPsiDY5Tp8OYB/DImStDL
 TuF2KQb8LMuzt0f9NThcSsGQeEIBuoul7IBxit0rtDmu1xzl+9qQ7ijRXY4NBVXEB7EL
 /EEw==
X-Gm-Message-State: AJcUukeJMWrdE85s5hYNFHJvtesZHRrbP0tr9pANk4uyRhPM6D1SXk36
 ijVX0MDtLoxxQAR0R42S9K+hSV7toHrh6w==
X-Google-Smtp-Source: ALg8bN6+iNgeqePI4L+kgpKCKNi/d6Sh4zqoQk48JdIZijTuudWHaJhskNruz2zNe+nb+Y1CfOhyhw==
X-Received: by 2002:a17:906:b3ce:: with SMTP id
 cg14mr38416329ejb.43.1549194777528; 
 Sun, 03 Feb 2019 03:52:57 -0800 (PST)
Received: from btopel-mobl.ger.intel.com
 ([2001:67c:1810:f055:c82b:bcf5:1add:2ef0])
 by smtp.gmail.com with ESMTPSA id l10sm2120719ejq.55.2019.02.03.03.52.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Feb 2019 03:52:57 -0800 (PST)
From: bjorn.topel@gmail.com
To: linux-riscv@lists.infradead.org, daniel@iogearbox.net, ast@kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH bpf-next 3/3] bpf, doc: add RISC-V to filter.txt
Date: Sun,  3 Feb 2019 12:51:31 +0100
Message-Id: <20190203115132.8766-4-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190203115132.8766-1-bjorn.topel@gmail.com>
References: <20190203115132.8766-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_035300_014068_7FD88E2D 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>, palmer@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgoKVXBkYXRlIERvY3Vt
ZW50YXRpb24vbmV0d29ya2luZy9maWx0ZXIudHh0IHRvIG1lbnRpb24gUklTQy1WLgoKU2lnbmVk
LW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vbmV0d29ya2luZy9maWx0ZXIudHh0IHwgMTYgKysrKysrKysrLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZmlsdGVyLnR4dCBiL0RvY3VtZW50YXRpb24vbmV0
d29ya2luZy9maWx0ZXIudHh0CmluZGV4IDAxNjAzYmMyZWZmMS4uYjVlMDYwZWRmYzM4IDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZmlsdGVyLnR4dAorKysgYi9Eb2N1bWVu
dGF0aW9uL25ldHdvcmtpbmcvZmlsdGVyLnR4dApAQCAtNDY0LDEwICs0NjQsMTEgQEAgYnJlYWtw
b2ludHM6IDAgMQogSklUIGNvbXBpbGVyCiAtLS0tLS0tLS0tLS0KIAotVGhlIExpbnV4IGtlcm5l
bCBoYXMgYSBidWlsdC1pbiBCUEYgSklUIGNvbXBpbGVyIGZvciB4ODZfNjQsIFNQQVJDLCBQb3dl
clBDLAotQVJNLCBBUk02NCwgTUlQUyBhbmQgczM5MCBhbmQgY2FuIGJlIGVuYWJsZWQgdGhyb3Vn
aCBDT05GSUdfQlBGX0pJVC4gVGhlIEpJVAotY29tcGlsZXIgaXMgdHJhbnNwYXJlbnRseSBpbnZv
a2VkIGZvciBlYWNoIGF0dGFjaGVkIGZpbHRlciBmcm9tIHVzZXIgc3BhY2UKLW9yIGZvciBpbnRl
cm5hbCBrZXJuZWwgdXNlcnMgaWYgaXQgaGFzIGJlZW4gcHJldmlvdXNseSBlbmFibGVkIGJ5IHJv
b3Q6CitUaGUgTGludXgga2VybmVsIGhhcyBhIGJ1aWx0LWluIEJQRiBKSVQgY29tcGlsZXIgZm9y
IHg4Nl82NCwgU1BBUkMsCitQb3dlclBDLCBBUk0sIEFSTTY0LCBNSVBTLCBSSVNDLVYgYW5kIHMz
OTAgYW5kIGNhbiBiZSBlbmFibGVkIHRocm91Z2gKK0NPTkZJR19CUEZfSklULiBUaGUgSklUIGNv
bXBpbGVyIGlzIHRyYW5zcGFyZW50bHkgaW52b2tlZCBmb3IgZWFjaAorYXR0YWNoZWQgZmlsdGVy
IGZyb20gdXNlciBzcGFjZSBvciBmb3IgaW50ZXJuYWwga2VybmVsIHVzZXJzIGlmIGl0IGhhcwor
YmVlbiBwcmV2aW91c2x5IGVuYWJsZWQgYnkgcm9vdDoKIAogICBlY2hvIDEgPiAvcHJvYy9zeXMv
bmV0L2NvcmUvYnBmX2ppdF9lbmFibGUKIApAQCAtNjAzLDkgKzYwNCwxMCBAQCBnb3QgZnJvbSBi
cGZfcHJvZ19jcmVhdGUoKSwgYW5kICdjdHgnIHRoZSBnaXZlbiBjb250ZXh0IChlLmcuCiBza2Ig
cG9pbnRlcikuIEFsbCBjb25zdHJhaW50cyBhbmQgcmVzdHJpY3Rpb25zIGZyb20gYnBmX2NoZWNr
X2NsYXNzaWMoKSBhcHBseQogYmVmb3JlIGEgY29udmVyc2lvbiB0byB0aGUgbmV3IGxheW91dCBp
cyBiZWluZyBkb25lIGJlaGluZCB0aGUgc2NlbmVzIQogCi1DdXJyZW50bHksIHRoZSBjbGFzc2lj
IEJQRiBmb3JtYXQgaXMgYmVpbmcgdXNlZCBmb3IgSklUaW5nIG9uIG1vc3QgMzItYml0Ci1hcmNo
aXRlY3R1cmVzLCB3aGVyZWFzIHg4Ni02NCwgYWFyY2g2NCwgczM5MHgsIHBvd2VycGM2NCwgc3Bh
cmM2NCwgYXJtMzIgcGVyZm9ybQotSklUIGNvbXBpbGF0aW9uIGZyb20gZUJQRiBpbnN0cnVjdGlv
biBzZXQuCitDdXJyZW50bHksIHRoZSBjbGFzc2ljIEJQRiBmb3JtYXQgaXMgYmVpbmcgdXNlZCBm
b3IgSklUaW5nIG9uIG1vc3QKKzMyLWJpdCBhcmNoaXRlY3R1cmVzLCB3aGVyZWFzIHg4Ni02NCwg
YWFyY2g2NCwgczM5MHgsIHBvd2VycGM2NCwKK3NwYXJjNjQsIGFybTMyLCByaXNjdiAoUlY2NEcp
IHBlcmZvcm0gSklUIGNvbXBpbGF0aW9uIGZyb20gZUJQRgoraW5zdHJ1Y3Rpb24gc2V0LgogCiBT
b21lIGNvcmUgY2hhbmdlcyBvZiB0aGUgbmV3IGludGVybmFsIGZvcm1hdDoKIAotLSAKMi4xOS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
