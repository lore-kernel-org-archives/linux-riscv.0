Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1228CCF2C1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 13:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hc/d5exmdtowOW1ZZUodnswRP44dbRMdCAOtQBno9MY=; b=ZUOC30tblRiump
	GKUaIU0XfX7DBdU62/gLyqNMNNqifFosl+J3euF+MX68arZjOeH+eSa0+DD7Mhre3bTwD75Nvaj2e
	dFawA+7mVIKg84s2Tjq1PN4m/PhP54Akbl56eqsfIe8wdPff47RzUGbnwP1qNw3/+ufSEpbaKr9v7
	OQTUNaSrwODyijX70QanlYPIZxSeI75WVDqLouM2A96geGPRydcwhy2X420o1pTkgDXHYhfou3CT1
	iK10mI31o/leM0ldBpVLZTA8S7tpP4gtBMgD1/T05Tj1k5N1v8Tt301fzGfFoJ8LSoIFVm3Cu0KBA
	tfqChzE0Xy+Hs/bdERAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI4t1-00000004o2U-0wLE;
	Sat, 17 Oct 2026 13:55:47 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI4sy-00000004o28-0ST0
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 13:55:45 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b056d58f2aso6421757b3.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 06:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792245342; cv=none;
        d=google.com; s=arc-20260327;
        b=TxM4VO9/YqVi8Ape0tyOnnmiEakA/zU6rjnZHB1EklaBkk+U/L4YSEqkaatwOn9CL8
         7iVphdSZhexqNRNPHLH4HTv7YigG7P3uC/9o+eG1YjkiPooHSp4AYGypokD5vJ/cRxkZ
         8Ab2X/xh5YP6kyhmE34HPEIweOg6xAMItaYwNrDo79Ki0dUyV5TOWPt51aM768j8qB5k
         sardEN6q+tAnATk8SUEmctkESs20xY5YtiPZp3Mz8SiEEMeYkahYiuKErS1hZzDy7l56
         8ysDoAWgsqWt4iGVTeUdoyXput9tqrQTWtCTICNOhUXfXx5p8Wx9UGDwTfPOnxW/lUHO
         BSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zWHX8p90fyI2wrQohQMLz7MxpnAPTt65/a6eQwFYUwc=;
        fh=aW2LHe829Q8tUECsAM/ubrx89QOk4Yzpes1/732T+io=;
        b=EfqtGz7b0jNZQzYvTv82+yz96MWeZuHnvPTHVpxUv8zgtfCecUkXAsm42iNShRN24R
         XklTMtlzJKBk+jmu4A4CkybUv33x5IxOb76sZTxYv6XmFOy4l/DsPaX12WeqZS7CtfFe
         vRlKHXvNLAEKYYXpN8UOeRmG74Bwgzk6J6lj+UnEweS2SqAmUGocBsPvcE3uEUhVmTZh
         +Pa0XxXWJx/vwJwOYD0Svfe1VqbEhMrukPgG+RpLUO+wd6CVJfgOr9r0/hm4pwkSmIHP
         EvszBZhe7t/kg94tH4QURvfk8h6leITgTqysSJ4WFLYOIUBHXRIIUqWnawhu00t9FACC
         lmNQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792245342; x=1792850142; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zWHX8p90fyI2wrQohQMLz7MxpnAPTt65/a6eQwFYUwc=;
        b=HAMak7eRZK7aTeiSYOnKv3H9jQmpiZ/9stm8ZxZFZtLzTsBDqbmW3BMCNgderA0m22
         gDA9L85puZJvyjW4OuJzHAlL73gZa/T0+6OB408CezPZ9T6kDrxOYN37EnkwQrZfcmfN
         I43Okx33WvapSh7OEat7RZoUPS60LRTbZsXyYu7bZiaFZWxUxqwf4l1FGepllYnkrjp1
         oai6eZmQAPRV/mB7c1T/Ouw80uMj9kuWj/M1zMORwYPdiZpcsQZU/7kFqAoM4hh1ko6P
         IUMWUp1TBeQb9amETHt1sA+WLBs7Qz5tGDZoUPrRngTV9pPdCuwi4ZKA261qSybkS1WZ
         tPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792245342; x=1792850142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWHX8p90fyI2wrQohQMLz7MxpnAPTt65/a6eQwFYUwc=;
        b=C5gsqqyOe4nmjgRbxCVdI8g7AKkFwfdpViRy6YB3Kcn+HAMqjmnNevv65W3UIMpE2l
         s43T80aPjBkPF+/u214v78eTB/SeWxtVwYzUn2sPsZGO0SywXFrhGF5bLhY5PKJVzjq3
         kQmzTWSckH2ahY4EGbnFysyxt1ODXF0WYBlfmOBqGHKjF3IQ/ubS4B2TVqCPRycEW9TU
         mlMG6zg8y8WvSQZmLPhoWQbMW5tkAXdnAj8eapp5nl0D8t00h7GUD5OOHdSTRoqLKC6v
         NdKs9vxDEixvbNXpyTZCTNPYium7OpiJ+Rz0ygzZGeuQztJg/daXR6PvVpJuaWkfQ2tw
         65eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxe/81m96h9OH+7U/QvU4hFDGSVEJ5ctsWjBM9dwPfxxjwoNcG4NkzBDg4neOXyEnPQVtmT9LnyW2gBvg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJptYlWXr2a7fWvUZfIc2WJVRj+BMj1gHpW26GoHBWIZ6G12FHh
	7U20BaE0jxOSFK827qW5A9A7n0WNr91GxqMehXxTAG9s/skmRAu0V66IpC2eyi6pimaX7lFJw7H
	z5XbOqD4kgL+v0tqAkdpO3clwFznZbH8=
X-Gm-Gg: AYBFou3glXRHMYgM9mp/0bu2hNjYIfVbvSd3oZSyNoZ2uWqfCKw1jfImyb6MsP73Hyq
	US6uXAuRdlKfMdRl92Yh4A4m+8fr3tzzypO8hbRkTR0uRAnXDi7zAuWFZ7rq3WIpbyzIYvr8+6g
	naV0FpciQYnZk4DPBcK6dxAp3AZdCN5UfNDO33H3636Zt0UgcVFgJkr/HJJ1FSkZ6X7ZLjSwQMs
	g1ph8uf5K7hbrbd6tXS6KP1LqceQgjWbVnLfTDu9iG6SudMC/nMDkars4Yu4HhQAi0ogQL4lpyS
	klZwcutfCFtpvBaFgrsUVKNpecSXySj9YC0FMaIgvo65ROVL9I6hNLM=
X-Received: by 2002:a05:690c:39a:b0:8b0:a8ce:5794 with SMTP id
 00721157ae682-8b0f216360emr9898317b3.26.1792245342432; Sat, 17 Oct 2026
 06:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com> <20261016103630.6e8fbaa5@gandalf.local.home>
In-Reply-To: <20261016103630.6e8fbaa5@gandalf.local.home>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sat, 17 Oct 2026 15:55:31 +0200
X-Gm-Features: AclHuK-2Q3jw5htyblPTbANoT7rDStvHfnCBo-DhiyiYGqRfnGspVuTujsxRsgk
Message-ID: <CALsPMBPnp8W68tFQKCtx=kxce4bUPx=MR_NwarOmKUJgC5_EPA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_065544_159120_5E32D8FD 
X-CRM114-Status: GOOD (  12.45  )
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

T24gRnJpLCBPY3QgMTYsIDIwMjYgYXQgNDozNuKAr1BNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgMzAgQXVnIDIwMjYgMTY6MzY6MzcgKzAy
MDAKPiBSb21hbiAnSGVkaW4nIFN0b3JvemhlbmtvIDxyb21ldXNtZWlzdGVyQGdtYWlsLmNvbT4g
d3JvdGU6Cj4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9yaXNjdl90bGIu
aCBiL2luY2x1ZGUvdHJhY2UvZXZlbnRzL3Jpc2N2X3RsYi5oCj4KPiBQbGVhc2UgZG8gbm90IHB1
dCBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgZXZlbnRzIGluIGluY2x1ZGUvdHJhY2UuCj4KPiBUaGV5
IGJlbG9uZyBpbiB0aGUgYXJjaGl0ZWN0dXJlLgo+Cj4gU2VlIHRoZSBleGFtcGxlIGNvZGUgaW4g
c2FtcGxlcy90cmFjZV9ldmVudHMvdHJhY2UtZXZlbnRzLXNhbXBsZS5bY2hdCj4gYXMgd2VsbCBh
cyB0aGUgTWFrZWZpbGUgdGhlcmUgb24gaG93IHRvIHB1dCB0cmFjZSBldmVudHMgaW4gZGlyZWN0
b3JpZXMKPiBvdXRzaWRlIG9mIGluY2x1ZGUvdHJhY2UvCj4KPiBUaGFua3MsCj4KPiAtLSBTdGV2
ZQo+CgpIaSBTdGV2ZSwKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCkkndmUgbW92ZWQgdGhlIHRy
YWNlIGV2ZW50IGRlZmluaXRpb24gdG8KYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9yaXNjdl90bGIu
aCBpbiB2NSwgZm9sbG93aW5nIHRoZSBleGlzdGluZwpSSVNDLVYgdHJhY2Vwb2ludCBjb252ZW50
aW9uLgoKVGhlIHVwZGF0ZWQgcGF0Y2ggaXMgYXZhaWxhYmxlIGhlcmU6Cmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYxMDE3LXRsYl90cmFjZXBvaW50LXY1LTEtMjU2ZmI1
MzkzYTdmQGdtYWlsLmNvbS8KClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuCgotLSAKS2lu
ZCByZWdhcmRzLApSb21hbiAnSGVkaW4nIFN0b3JvemhlbmtvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
