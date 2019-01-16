Return-Path: <SRS0=8WcR=PY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA70C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 19:06:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFB6B20873
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 19:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z97VG+2V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYCBm5kV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFB6B20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vZWLKA3uU71dIs1Q1ogbYpQmQo6QyITp/CT6TbH+MY=; b=Z97VG+2V2sRa1B
	bz+xJ2GUk+UZJWZXwuP1lPzjRhxxx1g01dSU9/vAzGaaONgWYee5J2QAyXURUaLkwwE3eiSNqfUUk
	tqNmg9X9UE4HX7fkgt1dAOhg/JON5gDCjywpmAvYUmC4UT1T3HpaZZiwVgeqK/4oN4DoSaZXQJC6N
	HeNPi1NsLcQGdQhakVFOEmxR6FZslZQRXGbl0arCRJpEowZSyo/mRAoHEyMG/XxVYDq0xuCe2dfwr
	ibntBpIWj/wJFhMGs9kuYemXaTvOITZ2a7fzlpjxLNWvWm3li4CCvzmBOUt4jxAdypPwNtm51Zy7q
	ovZRtBRzBp4E5yvZa+0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjqWA-0001QK-8B; Wed, 16 Jan 2019 19:06:26 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjqW5-0001Ps-QZ
 for linux-riscv@lists.infradead.org; Wed, 16 Jan 2019 19:06:24 +0000
Received: by mail-qt1-x842.google.com with SMTP id n32so8428366qte.11
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jan 2019 11:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a/Ix4UL7RxF8iUSMDzSxOWvlf6qtFBVXJ4pGbPq2pZ4=;
 b=bYCBm5kV+MGvyGLsnVN7aUnNJQE+slK3ARrsAPRPUw3MOXf8jkW/4WqpMV+TmbO1Hv
 xCdwsizgBA2cnchks5UIbl/vlm7xf/cn00fUfapMfMHctV0PUDWrPWjuPeyXh4M6nyKB
 /xyaiqgN0UHlLVmzH6qp0SspbuddtT4RlTui8KsHsrrT50A28mrOZPjCFXHRA3MB9eAk
 ZWxQHywYIEMkt2pXek8E+VuUB+RYnF4fZMUxkp1mvYQ0so4ak//u0hewMWpZ5kau8sb5
 CxEAe79Gka6YLXxI0RCRLMZwVy+4vKp36vUs897Q4to0KjJg6KDazYFtAQ5+jHJJExNH
 daBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a/Ix4UL7RxF8iUSMDzSxOWvlf6qtFBVXJ4pGbPq2pZ4=;
 b=MFlIc54jYhq3+FKbZjW+qMjL/CL4SgPMeFDpC3xPCyI+9xeAUC9mD8kz56eL7AXOrY
 MrhOH0ChZqvUglGXmGWdarj+eGmyxZ8Za5HSI8iPxz4Ro/xgbkFOJkOWp8/XRWMBtcq6
 KeoixvlmcQhI0lfwTkyuiLReQsqK7VqELc7J8lQo96HkHHzZY+e+/uomFPT5cD62B8Px
 qxnl8zzkEhzTI01uPusVQ/c+ZhJNwI0a7LNQ142vv25ve3YDksnhQU2GG1AqZXoKCcb+
 OEnDJqpxY8oXpScPyCguN4oXgiwXQ0XIxXu/QmgA0T2gXxrd3KSdnQGcj/2LhfSpgZD3
 BCVA==
X-Gm-Message-State: AJcUukf7Lv5MX4Poy9hQnfcl8cB9vnVzOLacgrbHRSOgZgtD1qPjjNEq
 Gu4jQxN8JcT+AurA9+KWXJ+kjbsF1ahLcyxuNHnMm2PK
X-Google-Smtp-Source: ALg8bN5z0tBYVTKMJysBSwpBWMmP7MQr1PtBejmSHgMPp/ym3DIvUNupPRYUUcpwxw/HdAweSTgBGlw/5O5JM7MBmsY=
X-Received: by 2002:ac8:8e1:: with SMTP id y30mr8425185qth.3.1547665580042;
 Wed, 16 Jan 2019 11:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20190115083518.10149-1-bjorn.topel@gmail.com>
 <20190115083518.10149-4-bjorn.topel@gmail.com>
 <efd18130-85b6-263c-85cb-1b19d81141f3@iogearbox.net>
 <CAJ+HfNg7Ud0RRZQHmbh_DmQDQYNRbSd3nTmNfjO-fX=0o0x-2A@mail.gmail.com>
 <912c38fc-e75d-a7f5-30bc-592e7498e958@iogearbox.net>
In-Reply-To: <912c38fc-e75d-a7f5-30bc-592e7498e958@iogearbox.net>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 16 Jan 2019 20:06:08 +0100
Message-ID: <CAJ+HfNjJ+Yy=+bpvBnAMugCQBjNNvaMBs=gBFfgE7U5dv37MRw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] bpf, riscv: added eBPF JIT for RV64G
To: Daniel Borkmann <daniel@iogearbox.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_110621_944213_5A739E88 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: Netdev <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, davidlee@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RGVuIG9ucyAxNiBqYW4uIDIwMTkga2wgMTY6NDEgc2tyZXYgRGFuaWVsIEJvcmttYW5uIDxkYW5p
ZWxAaW9nZWFyYm94Lm5ldD46Cj4KWy4uLl0KPgo+ID4gRm9yIHRoZSBmaXhlZCBwcm9sb2d1ZTog
aG93IGRvZXMsIHNheSB4ODYsIGRlYWwgd2l0aCBCUEYgc3RhY2sgdXNhZ2UKPiA+IGluIHRoZSB0
YWlsIGNhbGwgY2FzZT8gSWYgdGhlIGNhbGxlciBkb2Vzbid0IHVzZSB0aGUgYnBmIHN0YWNrLCBi
dXQKPiA+IHRoZSBjYWxsZWUgZG9lcy4gRnJvbSBhIHF1aWNrIGdsYW5jZSBpbiB0aGUgY29kZSwg
dGhlIHg4NiBwcm9sb2d1ZQo+ID4gc3RpbGwgdXNlcyBhdXgtPnN0YWNrX2RlcHRoLiBJZiB0aGUg
Y2FsbGVlIGhhcyBhIGRpZmZlcmVudCBzdGFjayB1c2FnZQo+ID4gdGhhdCB0aGUgY2FsbGVyLCBh
bmQgdGhlbiB0aGUgY2FsbGVlIGRvZXMgYSBmdW5jdGlvbiBjYWxsLCB3b3VsZG4ndAo+ID4gdGhp
cyBtZXNzIHVwIHRoZSBmcmFtZT8gKFllYWgsIG9idmlvdXNseSBtaXNzaW5nIHNvbWV0aGluZyEg
Oi0pKQo+Cj4gQmFzaWNhbGx5IGluIHRoaXMgY2FzZSB2ZXJpZmllciBzZXRzIHN0YWNrIHNpemUg
dG8gTUFYX0JQRl9TVEFDSyB3aGVuIGl0Cj4gZmluZHMgYSB0YWlsIGNhbGwgaW4gdGhlIHByb2cs
IG1lYW5pbmcgdGhlIGNhbGxlZSB3aWxsIGJlIHJldXNpbmcgPD0gc3RhY2sKPiBzaXplIHRoYW4g
dGhlIGNhbGxlciBhbmQgdGhlbiB1cG9uIGV4aXQgdW53aW5kcyBpdCB2aWEgbGVhdmUrcmV0Lgo+
CgpVZ2gsIHNvIGZvciAiZHluYW1pYyIgdGFpbCBjYWxscyB0aGlzIHdvdWxkIG1lYW4gIm1vcmUg
ZXhwZW5zaXZlCmZ1bmN0aW9ucyBjYWxscyB3aXRoIG1heGltdW0gc3RhY2sgdXNhZ2UgcGVyIGNh
bGwiPyBJLmUuIGVhY2ggdGFpbApjYWxsIGNvbnN1bWVzIE1BWF9CUEZfU1RBQ0sgcGx1cyByZWd1
bGFyIHByby0vZXBpbG9ndWUgcGx1cyBkZXB0aAp0cmFja2luZy4gSSdkIHN0aWxsIHByZWZlciBv
cHRpbWl6aW5nIHRvIHJlZ3VsYXIgZnVuY3Rpb25zIGNhbGxzLCB0aGFuCnRhaWwgY2FsbHMgLS0g
b3IgaXMgdGhhdCBuYWl2ZT8gV2hhdCBpcyBtb3N0IGNvbW1vbiBpbiBsYXJnZXIgYnBmCmRlcGxv
eW1lbnRzLCBzYXksIEthdHJhbiBvciBDaWxpdW0/CgpDaGVlcnMhCkJqw7ZybgoKCj4gQ2hlZXJz
LAo+IERhbmllbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
