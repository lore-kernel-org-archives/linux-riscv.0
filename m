Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B084C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 21:07:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07BD320825
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 21:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E/CK4eIA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Lo0LkcDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07BD320825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=jGvdjFSaBgod3Aem2GOsZ65gmSu3kfUD8XqKjdXoiTo=; b=E/CK4eIAQyc878KzGifvBD1TL
	J8nbx1HrvIkUrjE39PJPwoaZghylAS6JLmGj8NUdhQX/Onf9+ZXf3cAFw8s+OHUdYImG4OFUAhhQc
	2eQqBeL+cMLLz7lJ8YvhQq7wHM2PEdY8K3f3PxHQkEhXn88R7j5uxNBBSYGMVAEhMzPvTNw386wAl
	WIWUm5Tjoy12t+hCGkS6kOgjQ9t69tgsR0SxRlUI+26NFNoJf6OFtYgJAWz77utv/eTHiOSo2BytM
	lhjBeF6dduZVOKhHzc4WTuzBjx9++MqxTzxMJ40xb/jik//+BJlyBzlY8kjl5dLoLhlrGG8jc784x
	Act3ooVBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLDzs-00029t-4d; Fri, 09 Nov 2018 21:07:20 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLDzp-00028I-Ev
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 21:07:18 +0000
Received: by mail-pf1-x441.google.com with SMTP id u13-v6so1465515pfm.4
 for <linux-riscv@lists.infradead.org>; Fri, 09 Nov 2018 13:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=DtZf/Yhf6YcoCJQtZF/0TckJMdJbZDAs+n97jsH+NWg=;
 b=Lo0LkcDjzceyGEbQmVDxX2QEbERLDpRj0iVjak0bfGElpu8kKxQctdqHnTa4bLktZu
 06K1OLwk/rEH2+KN3bbfuhpH/pYBgWVmEeiFDu1P9/OgizrbRJGGTfhdvj7vY5/aZiif
 LiNMYgQirHQrM/8IHhX/N0RvQMqbVlUhRBim55fWJw9178eubvxN11qttm68RJvYFmzf
 W43TMUXNANiHxNfAwmkVg2CsYeJ3j0ZlUcSv7z2AK9ulmJN3lE0fv6INFFoAhpj2/kRi
 02g1Dh6XUcYtoat+UxSiaX58tQLYvccKzCnmU1Ot/pWFXYrhjUqP9Da/don0a4bwVnBC
 jOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=DtZf/Yhf6YcoCJQtZF/0TckJMdJbZDAs+n97jsH+NWg=;
 b=MMmtYSGkLTupi7+ODjKFFRbydMB8/67zjUgUGQI1YgB+sfJpN/1z085aJJ4Aivo5ky
 MuXvsDh3mesHtM0XSX+Lljtim8W9doK5SEHh7qqSLS+brABHNQ8xS6p643RQIIDWgx6p
 ZGXotmhwjE5467IjPn2xUu5UFai7d43zdfxhhqDpEKSw4mGWcACgzT4HAuuMc0Ze45Us
 5jzMjTr/UjQRVV1NuPOfyoRKkDrEESZz/jHLC9b12Xg6sUupTKJwKxAUd/orFOB0WnW8
 X9rrJvfN7COq6NXi2Do4wkeI0epJW69t2tRhmY84AoCrd8oFxoFtaIRfAx28Hx9qjV44
 aMQw==
X-Gm-Message-State: AGRZ1gLvZq5JNX1ozQWCnltVv3Hxns7lnGKmqSdnUIHbOOrgD1w4/aPV
 1gKkH77g8pcnG56GjX0isCbFNr8N/AU=
X-Google-Smtp-Source: AJdET5fIH+NiBOZBDeq8BSRMOeS9X953ImVxIGBzgZDZYYinojsUidMzX5lX5up4okGXgHl+tE1fMw==
X-Received: by 2002:a62:380e:: with SMTP id
 f14-v6mr10425998pfa.203.1541797624592; 
 Fri, 09 Nov 2018 13:07:04 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id n87-v6sm10101474pfb.62.2018.11.09.13.07.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Nov 2018 13:07:03 -0800 (PST)
Date: Fri, 09 Nov 2018 13:07:03 -0800 (PST)
X-Google-Original-Date: Fri, 09 Nov 2018 13:06:44 PST (-0800)
Subject: Re: [PATCH] RISC-V: recognize S/U mode bits in print_isa
In-Reply-To: <20181109193349.28179-1-me@packi.ch>
From: Palmer Dabbelt <palmer@sifive.com>
To: me@packi.ch
Message-ID: <mhng-cff31d5f-053e-4e62-997c-232c8bdd5fd3@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_130717_499748_FB14CAE1 
X-CRM114-Status: GOOD (  14.08  )
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
Cc: me@packi.ch, aou@eecs.berkeley.edu, anup@brainfault.org,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109210703.FmluiiOiUC23mNTh_NIRn8goAbpMPAEoZrEVRwBpZK4@z>

T24gRnJpLCAwOSBOb3YgMjAxOCAxMTozMzo0NyBQU1QgKC0wODAwKSwgbWVAcGFja2kuY2ggd3Jv
dGU6Cj4gUmVtb3ZlcyB0aGUgd2FybmluZyBhYm91dCBhbiB1bnN1cHBvcnRlZCBJU0Egd2hlbiBy
ZWFkaW5nIC9wcm9jL2NwdWluZm8KPiBvbiBRRU1VLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmlj
ayBTdMOkaGxpbiA8bWVAcGFja2kuY2g+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdS5jCj4gaW5kZXggM2E1YTJlZTMxNTQ3Li40MDI5YzdlNjg3MmIgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUu
Ywo+IEBAIC02NCw3ICs2NCw3IEBAIGludCByaXNjdl9vZl9wcm9jZXNzb3JfaGFydGlkKHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbm9kZSkKPgo+ICBzdGF0aWMgdm9pZCBwcmludF9pc2Eoc3RydWN0IHNl
cV9maWxlICpmLCBjb25zdCBjaGFyICpvcmlnX2lzYSkKPiAgewo+IC0Jc3RhdGljIGNvbnN0IGNo
YXIgKmV4dCA9ICJtYWZkYyI7Cj4gKwlzdGF0aWMgY29uc3QgY2hhciAqZXh0ID0gIm1hZmRjc3Ui
Owo+ICAJY29uc3QgY2hhciAqaXNhID0gb3JpZ19pc2E7Cj4gIAljb25zdCBjaGFyICplOwoKVGhp
cyBpcyBhIGJpdCBwZWRhbnRpYywgYnV0IHRoZSAiUyIgZXh0ZW5zaW9uIHNob3VsZCByZWFsbHkg
YmUgaGlkZGVuIGZyb20gCnVzZXJzcGFjZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
