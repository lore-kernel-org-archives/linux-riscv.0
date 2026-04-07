Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBB6FF5135
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 19:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/aqRyIlRfWz310nalrD17Ua2hag1zw23yqQpLp3ReHY=; b=dXyaRo6L4TQbcF
	DoHC8Qcxk0NXV6uuamGGh8R1swN2MP/0cXEiuS3nvAROixCt0KeDy5iYCwfpYO1ygk5TIuB1/wEGc
	n1hdFWu3eLoHNDZuOHs6IiF643kSWQLDXW+904aZ6fDb9jSt/UgCx2Xf4Bd8RU/YTSWaWt4AxQqAn
	CkUMO9XcQxJRbtGn/4UYOK1mVU74Im6putejhqKCM0lcmZrGwHeI1krmqhrwVXXYEMqSscC8M09jv
	9wO+UxzkGAB4W2UkiOpkFEnjLxf3kNHZSFFQBmA7+0y0m84K7cxJEVjxq20xI2tyqhMq70yN5eE9d
	9Jd1G7LRY9HL1MUO3h+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wACSj-00000007OcN-2HNT;
	Tue, 07 Apr 2026 19:51:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wACSg-00000007OZa-2O5O
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 19:51:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488879dcbc3so26815e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 12:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775591504; cv=none;
        d=google.com; s=arc-20240605;
        b=W5PH20D+iBRUUv4PB+b/R9gcNlIbApvKCUCBkebSx/Rgw+SB39t4mShJwPc5xbFCyo
         INVEgc2aE0+oepqv9qDZSQuUcSBuJfG1Y8B+lsSJyOLPafXHg6+3lAprf5s8YTtNRiwl
         G9lDkqfrC7pDpx9VMCrJoQ7/IkB3PG4yay5Zgah4fBbLOACF5NwGlom8g4P3gqRDK4nj
         D3cHCuPOHuw+8SCBCSGT5L9fU7ziomTtmJJ1YP87WS2ddSGZcyVTMsTwJ6cb3rQRoGFw
         HLPvGAHL0L2YayX3YYipwn14ve1t7Mkg89bP6b3fmAsvXOnUknE9szQJX+w5+NlLlsoH
         qZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qn1XLzSF2TmeeP2tNEdFXedeLBUwyZyS+b7if2Oc0rM=;
        fh=Cu5i1OB0aEMAGIqzR247crX6il70Du5VOvMarrR6i2g=;
        b=FK42gVWBQy5wYUhtHZz6O/SnN5RRI3JUSII0BVmNX39kCvJWRyXIjMq15KGpCr2DL5
         8qdE80mAOEhj4jO5jkcXU6gbq3cekYbJs7qiH0wgQficxMXZ9j/a0I0HHVYyxF9tRDP5
         MtbQHUUtBSLiLYuX77ziOvTKJAk1ki5NV3lXiDmrNH/oxCUTvN7/srxqgZV1YrjfZ265
         LHdJRQc84Q7cobnsYqMiP/bVEeiSdnopbpIRVUB9wW55J8vK5FVnoEHPzGXMOEMNiEpu
         2U13cfWPM4JTwirtieoTWfOVNBrkjIzXcHC8JSvlOCqMxKnP5pP5AMti1F/VupP11d6H
         DRRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775591504; x=1776196304; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qn1XLzSF2TmeeP2tNEdFXedeLBUwyZyS+b7if2Oc0rM=;
        b=unhPDvbOjw7YWUmR4L89QQxgiZPEMLUkbTwY5yIA4p4wao6AQCCyEa2yAtE5aPynNL
         NQLzsRFYGyaa/Izm/vt1NoqoaSBgavehi4KpXpv0o+N7HB+2Dtn8PwcF3PBFMcwo7v7M
         WwntZtnio4X5sVGL36NpjolmjYp6be/QkHIJZ5ET3zuX17tHUes+6NaLt620r3iluFUP
         O4ZD6uXTCNqvIRTcS9Kzy8jwFxkh4/bRQjZp+nfF6LyODPXbfUZkJ4yn13cD+JWAzzx8
         BB0z06uhuKk0TheW0a0IlFyYjVaAi/4sYw4m28JkKZkQc08kFr6zk9aba3FkSzExbi+n
         iw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591504; x=1776196304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qn1XLzSF2TmeeP2tNEdFXedeLBUwyZyS+b7if2Oc0rM=;
        b=OpLRQHYpKBnsLVGmb20sCOqhaTb/b+dmnheuCjO2YEbR9CxRNOu8QM4I8UuaYVR4Su
         Li8TaAoGNefh7ah7+/GlP9QYqxaTiPO5GCeBMgxsGOZF3YBQ9Gdx59dmFHJ85nW95Lrd
         W/ct9lgTgY8LY9uwc5KssYJXeRXNyunpeS4UQJJ4Bu9H8kudbiUf5gIRefwy0PbvHonB
         bXvRQBMMKNJ4cDoKnNoxbmRCkqXLj1hPGtbPh6A10wDbOQjZcR7ihIkR4/gZh8h9gUlV
         IxnDr4FII61l6X6ogmJffidi64D3qCJAwO7Na7mBVtR5uiMBM8+WxID1j7LNwEhFddMt
         GcCA==
X-Forwarded-Encrypted: i=1; AJvYcCUjn6oZa4H/JYqOfl5QWPqRZAoCgZkSoRsjx1o+pjCD62GzCSR/6YCXi/PXWRaqN/GhHO3MS5F0lX+FQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNF/g2qquPFMax9btbCEz5Ontgh4SiPnjuslDTvmn3DFhn65H9
	n5xwCtB99lD3iI2/qeEoNB2tQtJU+7XeyMMaKv+OqcxtIrm7oopCCET6LF1IsuO/SozWuPJap7C
	kxkyWDqLFpId8BgaXimsqMGuDBHL5EwGFod4duLzj
X-Gm-Gg: AeBDieu0E4nX2EIYLLsO/qN5lQov8Nh1XHNIvW/iAAzK9/scGg5ALc2U+EN/+jbSwRZ
	ZlqGu2ht8hmdMQ+bsqsdvHapKgua4znZAT2ef75rqamFZAHtThHdwgESpF0Th+Cqt0shDkInhmz
	tUBuXlgKGQ7ZlKQSQPnulCPthQ91imQRLbADCmViYsRL80QoJRM383nCA0waaVlfeawjMJjSo4+
	QFnoP32r5i4iHwo9Ga6B4cohgO3LcGNXheLre9V1wgs8cpuF6BRuYCCsUwYUOtIGuGBlGfRrc52
	JRTlsOhshS5Q475yUbxtDjw8BYNz18I7x0ufWg==
X-Received: by 2002:a05:600c:47d5:b0:477:255c:bea8 with SMTP id
 5b1f17b1804b1-4889bf61f64mr3217875e9.7.1775591503327; Tue, 07 Apr 2026
 12:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
In-Reply-To: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 7 Apr 2026 12:51:06 -0700
X-Gm-Features: AQROBzA8MspFFJKveCX0uZI0sP4vGpqImipYGDUPt-LZvJCZDd-1gIOBDFh3djA
Message-ID: <CABCJKufNJBgdfuJwCV1z9m1P4bi5DgcpMnguyuTsDQGfjUPqhA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Define __riscv_copy_{,vec_}{words,bytes}_unaligned()
 using SYM_TYPED_FUNC_START
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_125146_646197_1288DA37 
X-CRM114-Status: GOOD (  13.21  )
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

SGkgTmF0aGFuLAoKT24gTW9uLCBBcHIgNiwgMjAyNiBhdCA0OjI24oCvUE0gTmF0aGFuIENoYW5j
ZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEFmdGVyIGNvbW1pdCA2N2JkZDdi
MDEzODcgKCJyaXNjdjogU3BsaXQgb3V0IG1lYXN1cmVfY3ljbGVzKCkgZm9yCj4gcmV1c2UiKSBh
bmQgY29tbWl0IGMwM2FkMTVmN2NmNiAoInJpc2N2OiBSZXVzZSBtZWFzdXJlX2N5Y2xlcygpIGlu
Cj4gY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3MoKSIpLCB0aGVyZSBhcmUgQ0ZJIGZhaWx1
cmUgd2hlbiBib290aW5nCj4ga2VybmVscyB3aXRoIENPTkZJR19DRkk9eToKPgo+ICAgQ0ZJIGZh
aWx1cmUgYXQgbWVhc3VyZV9jeWNsZXMrMHgzOC8weGUwICh0YXJnZXQ6IF9fcmlzY3ZfY29weV93
b3Jkc191bmFsaWduZWQrMHgwLzB4NTA7IGV4cGVjdGVkIHR5cGU6IC4uLikKPiAgIENGSSBmYWls
dXJlIGF0IG1lYXN1cmVfY3ljbGVzKzB4MzgvMHhlMCAodGFyZ2V0OiBfX3Jpc2N2X2NvcHlfdmVj
X3dvcmRzX3VuYWxpZ25lZCsweDAvMHgyNDsgZXhwZWN0ZWQgdHlwZTogLi4uKQo+Cj4gVGhlIF9f
cmlzY3ZfY29weV8qX3VuYWxpZ25lZCgpIGZ1bmN0aW9ucyBhcmUgbm93IGNhbGxlZCBpbmRpcmVj
dGx5IGJ1dAo+IHRoZXkgYXJlIG5vdCBkZWZpbmVkIHdpdGggU1lNX1RZUEVEX0ZVTkNfU1RBUlQs
IHdoaWNoIGlzIHJlcXVpcmVkIGZvcgo+IGFzc2VtYmx5IGZ1bmN0aW9ucyBjYWxsZWQgaW5kaXJl
Y3RseSBmcm9tIEMgdG8gcGFzcyBDRkkgY2hlY2tpbmcuIFN3aXRjaAo+IHRvIFNZTV9UWVBFRF9G
VU5DX1NUQVJUIHRvIGNsZWFyIHVwIHRoZSBDRkkgZmFpbHVyZXMuCj4KPiBGaXhlczogNjdiZGQ3
YjAxMzg3ICgicmlzY3Y6IFNwbGl0IG91dCBtZWFzdXJlX2N5Y2xlcygpIGZvciByZXVzZSIpCj4g
Rml4ZXM6IGMwM2FkMTVmN2NmNiAoInJpc2N2OiBSZXVzZSBtZWFzdXJlX2N5Y2xlcygpIGluIGNo
ZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzKCkiKQo+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBD
aGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwv
Y29weS11bmFsaWduZWQuUyAgICAgfCA1ICsrKy0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3ZlYy1j
b3B5LXVuYWxpZ25lZC5TIHwgNSArKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCkxvb2tzIGdvb2QgdG8gbWUuIFRoYW5rcyBmb3IgdGVzdGlu
ZyB0aGlzIGNvbmZpZ3VyYXRpb24hCgpSZXZpZXdlZC1ieTogU2FtaSBUb2x2YW5lbiA8c2FtaXRv
bHZhbmVuQGdvb2dsZS5jb20+CgpTYW1pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
