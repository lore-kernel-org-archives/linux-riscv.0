Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB23C54EBC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 00:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+U9oCUDshNWW23DS5HhpVYUkrlYx5Xl2LcO4bRNJ34=; b=SffLdk6T4NJXiJ
	EksVYRbZMiP1im3GpGRigvotFvuXlTv6mZ6GtFNwUtt5mcdkmDkd1chZHxxnJlioeGzKaZ7V/d8nv
	C3+JrlcXpmaRDr2Sxbf5CCBYwhMSjVN16iYqiskikVLHztph1BqAEbxeHqeeSns8Gnn8yH5/Bj55R
	Fbu5E+gLo6HToq6Y8x90m+pKC5iL5BQtW5bUbIonhnv8+XGzYBzhWjw5oD+CfYTPdZ00paWbBFsIn
	/6AXTDs5YrAp6r8dDQfeY6rAtURyouIecvNnyKih2y7cMELxFaqF48t5nBeWUL/QKwoPOXxAYz2Rg
	ifIsKC4chCoG4FW0D0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFP08-0092OX-9x; Wed, 11 Jan 2023 00:29:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFP05-0092O0-Jj
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 00:29:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so1798827wml.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 16:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GDU3b13swhpz+1ckV3zC5q8bsKV80I63Ph9YXnKd44=;
        b=MVu1Z5Mjgqd/lMdG+8zThTcHew9/lkSWteEBbsvcqcLcceQQm00jXGEBCbf3BnBqWT
         1fR+kGJvfPgS/VxbQXXPAr2VlpQCsi8K3bccTdeIiDCrKy1UX2l5lkH/6x1b0j99WYst
         o7ffOv6vD2UBnjtq8/YX7QrGQc2g+9ki1TGiwnr7SsZCcjn9QBQ6CRTo0u1zbJEY0s9G
         N6XgRxKYifsIJZymsIFwqKPh7keaWJsFrI2V3VsjSmwo+zVsH9I8KOUJb3Pb2UqDss3L
         hdnRUgs9lKNbMXkyeKecL55aF0/jDABJyVP6SkUMIWbctJ2UULKqMx+96EcXB/XBc9PM
         BzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GDU3b13swhpz+1ckV3zC5q8bsKV80I63Ph9YXnKd44=;
        b=p0TW2M9UkN+jUppyJEPtMRdCvnxy3Loc1iTfGTf0zYpqdG7f23gHfCprbHX6dSvrGo
         WJVOd/BWKK5DNZzdLfVv7SL8nMghyMZvGCgsbsp1cGvWKOIfXrlHmQXxUXU2VsSt0VLF
         CFo2xjebrEpPfC483McJGWrG/7afNLfB4uv5wQ3+up96aHcH7ERNTVq7FxWYzFAyrbA6
         ulhzMXM3zSN1OFf3ZUSKcIsio9qRC4DP/g5MROe/mC6/GiAXiXvN1/wYxyZeoLZm7vhB
         vlVN/vDtA7nt/PO2nmFaE7XB6MrkvdoAe41oyYGvv3bsa2k1SWy5YgszseQyKn22S4+c
         u0uA==
X-Gm-Message-State: AFqh2kpX27US6VsULSJYlS81lQdHAqXhhmnRtcga52JIjExombe18nbk
	QfLW40NfPECAHKh4gdKly8QUFQ==
X-Google-Smtp-Source: AMrXdXtvZ3JYT6h2W6TAS9MDvlYVEP/AIF175SWm5edz18p9MIWrt4unOJiYVDWg3IitA6BqmlFgOg==
X-Received: by 2002:a05:600c:3596:b0:3cf:497c:c4f5 with SMTP id p22-20020a05600c359600b003cf497cc4f5mr53050191wmq.13.1673396991015;
        Tue, 10 Jan 2023 16:29:51 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id f11-20020a05600c4e8b00b003d04e4ed873sm24073379wmq.22.2023.01.10.16.29.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Jan 2023 16:29:50 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] riscv: elf: add .riscv.attributes parsing
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <3e91a775-c671-35e8-0966-3ec9d8999e14@rivosinc.com>
Date: Wed, 11 Jan 2023 00:29:49 +0000
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux@rivosinc.com,
 kernel test robot <lkp@intel.com>
Message-Id: <A2A77A5F-0322-4BFA-A163-33E373C819F7@jrtc27.com>
References: <20230110201841.2069353-1-vineetg@rivosinc.com>
 <01AF458D-1EDC-47D1-A902-A686E2DF26AF@jrtc27.com>
 <6dcdd143-ff1c-41f7-9f46-0c4505575669@rivosinc.com>
 <9061941F-3221-467D-B0FC-DCA8E8FF3996@jrtc27.com>
 <3e91a775-c671-35e8-0966-3ec9d8999e14@rivosinc.com>
To: Vineet Gupta <vineetg@rivosinc.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_162953_722134_4E7F056A 
X-CRM114-Status: GOOD (  10.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAgSmFuIDIwMjMsIGF0IDIzOjQ1LCBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3NpbmMu
Y29tPiB3cm90ZToKPiBPbiAxLzEwLzIzIDE1OjIxLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPj4+
PiBZb3UgYWxzbyBzaG91bGQgaGFuZGxlIG1vcmUgdGhhbiBvbmUgc3ViLXN1YnNlY3Rpb24gZXZl
biBpZiB0b29scyBkb27igJl0Cj4+Pj4gZW1pdCBpdCB0b2RheS4KPj4+IEp1c3QgdG8gYmUgb24g
c2FtZSBwYWdlLCBhIHN1Yi1zZWN0aW9uIGltcGxpZXMgdGhlIGZvbGxvd2luZwo+Pj4gCj4+PiAg
ICAgICB1aW50MzI6bGVuLCBOVEJTOnZlbmRvci1uYW1lLCB1aW50ODogVGFnX2ZpbGUsIHVpbnQz
MjpkYXRhLWxlbiwgPHRhZz48dmFsdWU+Li4uLgo+Pj4gCj4+PiBJZiBzbywgdGhlIGNvZGUgZG9l
cyBzdXBwb3J0IG11bHRpcGxlIG9mIHRoZXNlCj4+IFRoYXTigJlzIGEgc3ViLXNlY3Rpb24sIGJ1
dCBJIHNhaWQgc3ViLXN1YnNlY3Rpb24uCj4gCj4gVGhlIHBzQUJJIGRvY3VtZW50YXRpb24gdGhh
dCB3ZSByZXZpZXdlZCB5ZXN0ZXJkYXkgb25seSBtZW50aW9ucyBUYWdfRmlsZSA9IDEgYW5kIGRv
ZXNuJ3QgbWVudGlvbiB0aGUgdGVybSBzdWItc3Vic2VjdGlvbiBhdCBhbGwuCj4gV2UgbmVlZCB0
byBiZSBjb25zaXN0ZW50IGJldHdlZW4gY29kZSBhbmQgdGhlIG5ldyBkb2N1bWVudGF0aW9uIG9y
IGp1c3QgYWRkIHJlZmVyZW5jZSB0byBBUk0gZG9jdW1lbnRhdGlvbiB3aGljaCBjb3ZlcnMgZXZl
cnl0aGluZyBhbmQgd3JpdGUgdGhlIGdlbmVyYWwgcHVycG9zZSBwYXJzZXIuCgpEb2N1bWVudGF0
aW9uIHlvdSB3cm90ZSBhbmQgaGFzbuKAmXQgYmVlbiBhcHByb3ZlZCBieSBhbnlvbmUgZWxzZS4g
V2hlcmUKSSBzYWlkIHRoYXQgd2UgbmVlZCB0byBkb2N1bWVudCB0aGF0IG11bHRpcGxlIHN1Yi1z
dWJzZWN0aW9ucyBhcmUKYWxsb3dlZC4KCkplc3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
