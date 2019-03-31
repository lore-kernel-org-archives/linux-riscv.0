Return-Path: <SRS0=bU7R=SC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF117C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 31 Mar 2019 14:37:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF3920870
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 31 Mar 2019 14:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k56thafT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDe3mEoG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDF3920870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hq1viM7QHPW4NdZGTVQV7y4T9rjRJES2escWfWdYkv4=; b=k56thafT0/Wl/r
	sYl6dMn5Omw1Hn2zXEGjnR2dIbTisHRv8b7G3zUSGX2J7J8qHqTxZRWq8PivHlK9b5h66gAB9w1Gg
	nRwAC1ZVfW2zrxInJ5XzhKhddZnN+YeSlNSF8CYdh7hVcmLBBxlNgy1WAtEBPLmuWtKh/sl+7xYou
	3pSEpPLEKX4QV6EE4paY7TiRzabuWYpBWmmbcAr3j5tFRpawQbBqT4/0ND2wPi/W8Z2eaUOh0Yc1k
	mbuSVoir8OPMZjd7pOpB5tpWb1Ee4kcgnQasfpp+Y+H/E59Gv2GZ7wwEU25fwqWOOQec+8MgtWEPV
	cKNl/u5JCQEMnzN6g1jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAbae-0003AF-F3; Sun, 31 Mar 2019 14:37:40 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAbab-00039G-0W
 for linux-riscv@lists.infradead.org; Sun, 31 Mar 2019 14:37:38 +0000
Received: by mail-ed1-x533.google.com with SMTP id v21so5911406edq.4
 for <linux-riscv@lists.infradead.org>; Sun, 31 Mar 2019 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=mFqiNT7yKYYJrIcG2+QmcyhN7f064o4pkWHwUJJY+Ic=;
 b=pDe3mEoGw6QM0SLWyIxIoYdYION9q46IHPMLGfcp9tEO1QvabtYQF1pwt8KaLkdw/+
 cKJI9/cqy45TzIB+TI1NwC/FnqYFH4TCxUsqBe1L00k1ryahqHIMazXbEnweO6busTEL
 sg7Q7XMKU6pQzXW0Cp8kIZ0I7zhSmdh3xRLTN8lK8XPgw4XCSECeRyMLcWupa4x7zmxo
 NZ3XjeAKVQYQ7dcHzMxtn1FgjlGERdeBt9NIIRV8fcdrct6Xnn2ThdY4mqB2Vj3/LUZ6
 v7aIQk1WMR+We5YXEG+IlBs99BlewsacjqctBMt+EWtzsEETgUbvOY2nTwBw80uPwHgx
 JwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=mFqiNT7yKYYJrIcG2+QmcyhN7f064o4pkWHwUJJY+Ic=;
 b=jzAI+05q/rgFZO6du0Xv3d3ENuol9DO1YarcwaVxqHkWQp0RmT8kWOqPzc/c48jAul
 Db/DS8TdjXSJU16pEIreMPdYL4XlCwci94MBa4W4sg7JXp7L1+0oLNiZE9f+YVlaIp8P
 /RcCnFFf0uwF5nep4rw0HW7h4w013RwfFYXA8m7hBHuwJs+tdLuMC6qMptOjWcIZCEAk
 yOtFe53LQr/YT0R3ss0WM6iI6yJp6Gh5MKeiDyVRfClfNQusWrFJYw3VlHe44uNvzADU
 DHsLClzg9pkTbkclu09ecBZ2mPejZ2p9EJZdIJoKh49Oc/fVwESZkuOywR7KssQfczqJ
 uh8g==
X-Gm-Message-State: APjAAAXyhpiNi3VoamfKmUbSv5NhWoUdQcj20MNz2PZS+LLAs1/Vzyco
 SQRqY1dISFz2brVqf7+R5ZB0WYnp
X-Google-Smtp-Source: APXvYqyclzxKgo4bg40N8+qG0WAXZVOUmKRLR2/rXRJfx8fAgiRCrK//jbS22QRsNSgm4QrB5DfPIg==
X-Received: by 2002:a50:9271:: with SMTP id j46mr10416160eda.149.1554043054713; 
 Sun, 31 Mar 2019 07:37:34 -0700 (PDT)
Received: from aurora.visucore.com (92-110-144-95.cable.dynamic.v4.ziggo.nl.
 [92.110.144.95])
 by smtp.gmail.com with ESMTPSA id u18sm1379443eja.25.2019.03.31.07.37.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 31 Mar 2019 07:37:34 -0700 (PDT)
Date: Sun, 31 Mar 2019 16:37:32 +0200
From: "Wladimir J. van der Laan" <laanwj@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: Perf counters on SiFive FU540-C000
Message-ID: <20190331143732.7n4b5llrkxs5nbvm@aurora.visucore.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_073737_079436_5E18135C 
X-CRM114-Status: UNSURE (   7.74  )
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
Cc: Alan Kao <alankao@andestech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpJJ20gcGxhbm5pbmcgb24gZG9pbmcgc29tZSBvcHRpbWl6YXRpb24gd29yayBmb3Ig
UklTQy1WLCBzbyBJJ2QgbGlrZSB0byBhZGQKcGVyZiBzdXBwb3J0IGZvciB0aGUgcGVyZm9ybWFu
Y2UgY291bnRlcnMgb24gdGhlIEZVNTQwLUMwMDDigJRhcyBkZXNjcmliZWQgaW4KU2VjdGlvbiA0
LjEwIG9mIHRoZSAiU2lGaXZlIEZVNTQwLUMwMDAgTWFudWFsIi4KClRoZXNlIGFyZSB2ZXJ5IGJh
c2ljOiBDU1JzIG1ocG1ldmVudDMgYW5kIG1ocG1ldmVudDQgY2FuIGJlIHVzZWQgdG8gY2hvb3Nl
IGEgY2F0ZWdvcnkKKEluc3RydWN0aW9uIENvbW1pdCBFdmVudHMsIE1pY3JvYXJjaGl0ZWN0dXJh
bCBFdmVudHMsIE1lbW9yeSBTeXN0ZW0gRXZlbnRzKSwgdGhlbgpmcm9tIHRoZXNlIGNhdGVnb3Jp
ZXMgYSBiaXRtYXNrIG9mIGV2ZW50cyBjYW4gYmUgc2V0IHRoYXQgd2lsbCBpbmNyZWFzZSB0aGUg
YXNzb2NpYXRlZApjb3VudGVyIHdoZW4gdGhleSBoYXBwZW4uIEkgZG9uJ3QgdW5kZXJzdGFuZCB0
aGUgcmF0aW9uYWxlIGZvciBjb3VudGluZyBtdWx0aXBsZQpraW5kcyBvZiBldmVudHMgaW4gb25l
IHJlZ2lzdGVyLCBzbyBmcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB0d28gY291bnRlcnMgY2FuIGJl
CnN1cHBvcnRlZCBhdCBvbmNlIGluIHRoZSBwZXJmIGludGVyZmFjZS4KCkkgZm91bmQgc29tZSBk
b2N1bWVudGF0aW9uIGFib3V0IHBsYXRmb3JtIHNwZWNmaWMgY291bnRlcnMgaW4gRG9jdW1lbnRh
dGlvbi9yaXNjdi9wbXUudHh0LApob3BlZnVsbHkgdGhpcyBpcyBlbm91Z2ggdG8gZ2V0IG1lIHN0
YXJ0ZWQuCihJZiBzb21lb25lIHN0YXJ0ZWQgd29yayBvbiB0aGlzLCBwbGVhc2UgbGV0IG1lIGtu
b3cpCgpLaW5kIHJlZ2FyZHMsCldsYWRpbWlyIHZhbiBkZXIgTGFhbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
