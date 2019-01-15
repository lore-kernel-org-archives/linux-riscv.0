Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEFAC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 08:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2F22063F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 08:35:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LaRSOsoR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUo7X7nX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D2F22063F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VYxu1TFv3BzK18eTvOjzk2DJi6lLPOzVBsR93qnMF8c=; b=LaRSOsoRX++BKj
	n+6EcvyZYQdyK4hX7wPdOJM+qeJs+AHyyHZWWT2zX48SUt2c/gsOSUI+g5KLhIBvjHucs1JWudk4I
	+wnXH+HtxiWsGFXS0+Fltu7iwY7XxQfJW9+x13KtpuZq9rLLKTuWjcFXdRqxrhuCjuTbqLTjxwHUV
	p4AV8oigi4lBDvnTFDY78mF2zpNpbwRbYDb/zcXyial/HreRmqttWDGy6A/9zYVbVDyG/q4+V4c6d
	fPj7bAmT4ydqxwV7QgARiDy6dg6gPCsG/+oJREvIBp349gq1hV8kyQgE7pfDL3oX+zspT33eAVbKf
	4iLdPpgAjqvbfSpIC8qQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjKCK-0002s8-RF; Tue, 15 Jan 2019 08:35:48 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjKCH-0002rb-HL
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 08:35:46 +0000
Received: by mail-lj1-x242.google.com with SMTP id v1-v6so1603162ljd.0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jan 2019 00:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=54UCKXD55YHOKubS5JS59AxRACPcjYF8KFxR/pvfPzI=;
 b=UUo7X7nXPfMIid3V8x1AP+JC4SGOMvIAcMSm8O5K2VG2Tca+bKxtq4TQJ8Ero5bua5
 TxLcVMeGwcnbwJd7+8oDF0j4AhqJrsekXZIszbUyGeeZgYiJq+fsChTiYWLwgZ9S6i0c
 PnyDOKxjmGQ1qos/URa1rJz/XnSfqJbsAeZQFJOdLc7JxD+B5MgDl5jo2AHkAKtYwna8
 jirqhOc+DZ2Nzbgb6DdSjAVxzmaA7+y0jBlo57UFqUNVttslsaanAlIiS2GpOJrvUGCO
 NCaJT1OwfZmLAA9gLYMxBrtnInM5z2FEjp5b5FzUNvrK2cL64ebOt/n7bqjutDm3/0Rh
 /aHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=54UCKXD55YHOKubS5JS59AxRACPcjYF8KFxR/pvfPzI=;
 b=DfZpDtH8tOhjLUpS3KWTe7MtfbmgqfamNe6L2of94uQI/gXKoeJyQivlvr+H6Y5xYs
 4NHjp8mF2Nw0cFWbwap+FvIq/LAYlB72+T/K/MeKhFTBr90BJYWAIXXXvPs4ySID99kG
 NeSossusI8CHcwfrUZ7VngoOwqp1JzfyLwz/yI9MHmpl46LiozN9Ysl/YKg7+xcxMTRG
 MYpan7m3mcBmRRJV7BeKVhiak3jzH/HZutzG1MMIi41tTm5hrGNPA3N9HL1yeDw7zxSo
 /veY6H6+oHY7uLgsj8C+0W7rZlrus9qhnUKOVoW/nLbZhdjppBzsidGzJB1fiknhr4BY
 GaYw==
X-Gm-Message-State: AJcUukcwLhyaPO7TWvRySNRm10atE3hROrQLWYC1O7vjnZgYxqw9RcsH
 rUbZCyEkjqyXkzpXxCT248VbagV9cI/PCA==
X-Google-Smtp-Source: ALg8bN5JSLwoATDB3fZMXpwQvqny651ZRVa+L8o6zDEpg8IlWloedmWoNdlNk/jqPKb9WaOSzYR4Dw==
X-Received: by 2002:a2e:90ca:: with SMTP id
 o10-v6mr1877605ljg.134.1547541342295; 
 Tue, 15 Jan 2019 00:35:42 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([213.100.199.124])
 by smtp.gmail.com with ESMTPSA id e14-v6sm453004ljb.31.2019.01.15.00.35.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Jan 2019 00:35:41 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [RFC PATCH 0/3] RV64G eBPF JIT
Date: Tue, 15 Jan 2019 09:35:15 +0100
Message-Id: <20190115083518.10149-1-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_003545_619098_D943F22E 
X-CRM114-Status: UNSURE (   9.57  )
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 palmer@sifive.com, davidlee@sifive.com, daniel@iogearbox.net,
 netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGkhCgpJJ3ZlIGJlZW4gaGFja2luZyBvbiBhIFJWNjRHIGVCUEYgSklUIGNvbXBpbGVyLCBhbmQg
d291bGQgbGlrZSBzb21lCmZlZWRiYWNrLgoKQ29kZXdpc2UsIGl0IG5lZWRzIHNvbWUgcmVmYWN0
b3JpbmcuIEN1cnJlbnRseSB0aGVyZSdzIGEgYml0IHRvbyBtdWNoCmNvcHktYW5kLXBhc3RlIGdv
aW5nIG9uLCBhbmQgSSBrbm93IHNvbWUgcGxhY2VzIHdoZXJlIEkgY291bGQgb3B0aW1pemUKdGhl
IGNvZGUgZ2VuZXJhdGlvbiBhIGJpdCAobW9zdGx5IEJQRl9LIHR5cGUgb2YgaW5zdHJ1Y3Rpb25z
LCBkZWFsaW5nCndpdGggaW1tZWRpYXRlcykuCgpGcm9tIGEgZmVhdHVyZXMgcGVyc3BlY3RpdmUs
IHR3byB0aGluZ3MgYXJlIG1pc3Npbmc6CgoqIHRhaWwgY2FsbHMKKiAiZmFyLWJyYW5jaGVzIiwg
aS5lLiBjb25kaXRpb25hbCBicmFuY2hlcyB0aGF0IHJlYWNoIGJleW9uZCAxM2IuCgpUaGUgdGVz
dF9icGYua28gKG9ubHkgdGVzdGVkIG9uIDQuMjAhKSBwYXNzZXMgYWxsIHRlc3RzLgoKSSd2ZSBk
b25lIGFsbCB0aGUgdGVzdHMgb24gUUVNVSAodmVyc2lvbiAzLjEuNTApLCBzbyBubyByZWFsIGhh
cmR3YXJlLgoKU29tZSBxdWVzdGlvbnMvb2JzZXJ2YXRpb25zOgoKKiBJJ3ZlIGFkZGVkICJIQVZF
X0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIiB0bwogIGFyY2gvcmlzY3YvS2NvbmZpZy4gSXMg
dGhpcyBhc3N1bXB0aW9uIGNvcnJlY3Q/CgoqIGVtaXRfaW1tKCkganVzdCByZWxpZXMgb24gbHVp
LCBhZGRzIGFuZCBzaGlmdHMuIE5vIGZhbmN5IHhvcmkgY29zdAogIG9wdGltaXphdGlvbnMgbGlr
ZSBHQ0MgZG9lcy4KCiogU3VnZ2VzdGlvbnMgb24gaG93IHRvIGltcGxlbWVudCB0aGUgdGFpbCBj
YWxsLCBnaXZlbiB0aGF0IHRoZQogIHByb2xvZ3VlL2VwaWxvZ3VlIGhhcyB2YXJpYWJsZSBzaXpl
LiBJIHdpbGwgZGlnIGludG8gdGhlIGRldGFpbHMgb2YKICBtaXBzL2FybTY0L3g4Ni4gOi0pCgpO
ZXh0IHN0ZXBzIChwcmlvciBwYXRjaCBwcm9wZXIpIGlzIGNsZWFuaW5nIHVwIHRoZSBjb2RlLCBh
ZGQgdGFpbApjYWxscywgYW5kIG1ha2luZyBzdXJlIHRoYXQgYnBmdG9vbCBkaXNhc3NlbWJseSB3
b3JrcyBjb3JyZWN0bHkuCgpBbGwgaW5wdXQgYXJlIHdlbGNvbWUuIFRoaXMgaXMgbXkgZmlyc3Qg
UklTQy1WIGhhY2ssIHNvIEkgc3VyZSB0aGVyZQphcmUgYSBsb3QgdGhpbmdzIHRvIGltcHJvdmUh
CgoKVGhhbmtzLApCasO2cm4KCgpCasO2cm4gVMO2cGVsICgzKToKICByaXNjdjogc2V0IEhBVkVf
RUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKICByaXNjdjogYWRkIGJ1aWxkIGluZnJhIGZvciBK
SVQgY29tcGlsZXIKICBicGYsIHJpc2N2OiBhZGRlZCBlQlBGIEpJVCBmb3IgUlY2NEcKCiBhcmNo
L3Jpc2N2L0tjb25maWcgICAgICAgICAgICB8ICAgIDIgKwogYXJjaC9yaXNjdi9NYWtlZmlsZSAg
ICAgICAgICAgfCAgICA0ICsKIGFyY2gvcmlzY3YvbmV0L01ha2VmaWxlICAgICAgIHwgICAgNSAr
CiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXAuYyB8IDE2MTIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDE2MjMgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvbmV0L01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wLmMKCi0tIAoyLjE5LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
