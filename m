Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2BDCC6B39
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cz0RgxtCM0aFC3mlz8C/C2+YmQiYh4MjKvjdTKDlTw4=; b=CLmkIMTRhC8pRO
	kFRfgOQkdWSbL5josQl9aUyxAeclk+VKkbNP5f9vh9wO9y1f/CTJwIBq3i09DXlUeENj2oNq0+tNh
	yUt/5BEh9xswCc0zROk7Y60VRRytTxMruKStk3xZI0eyOcI6sq0Ztyo6EhHwvpwtCtu0rTYhnNcNd
	8Lun2+DrRhWH6cbXGeem879DBglMlQRELNvUXFLl+zMUNSLCYMlSKlnIxdaXWI4K0kpZp6Rhbxrug
	LjpOHCCxaZnC0MyarlhGZ+WBHAbyRpbDRUy4flJOWZHKMkdDD/50zQ4EZiFuGlQ1YKGWCepkGRG6V
	8LR8Yl0zF9YH6UlTFh1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOwJ-00000000wXW-1IMO;
	Thu, 15 Oct 2026 17:08:23 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOwG-00000000wWf-3nYb
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 17:08:22 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8ab38a051aaso48063497b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 10:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792084099; cv=none;
        d=google.com; s=arc-20260327;
        b=hAsOo0BP4lYVyttWDzhOWuDVTX9bFlRgOTI9TN4QhAIQo8pgpLXAGE986j61FS82Xn
         8ADsLB37+OJ/sIWUFWrIX4BDj+M7TA0fynsx3Q09hacBXaYJc1zi8FHgMWZkECKiJ1Qf
         5Mo/v3WSUgxOdkDs202uQKDnSRmGzzMjq/lVl02EjA5qmZysrB2ZWHoSoii5k2WP0Eu9
         lWHFCUQemU65LSVWmRwiQxabCUZRoaB0w4nusGaHVfiYrW202njR2e4FExGH+vExrk8O
         m9bIzgQXtUsvrht8iEJbSKSCX4iXoyXtd0i0FufAKQd8tZIKZASwkDet6JXieNICeSK+
         50WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EOjLYNLitfJIInUWIMI+uegThTaF0Q0MItF25km4ERw=;
        fh=oYI2WemkHx8iDIjzuFIy2lH2WBLKFMlBen8jJcqRpts=;
        b=QUdhOsxzwfz7gxPP+INRn1Ph4hiibLm7pT5HjM74gnbCBpbclcMC3NMyLQXFjENb7E
         wuvinyouiFh4jrlqy9haqmvxLT8e9zIvHV9v42n0tNLHaZJsszbb4c7VC5IpxENyT9jk
         BcjTiXnimMRqdcYsldO6XitBDQ6/Sj4iGrzGLHnM2w7MugYxPbo3ej281zL7QpPwmdvE
         I+eo+9rQeX+a5FeFIrhCprXtqLkanOH7ElgPJYzMx5vm1+5B+ggMP5PhkT6LiTqLccby
         1J8Aa+FaKD949lmS63J80RxR8eH9GDAGAhuIOnHeQDSFXr/B/0PovkxLq5/UAQqcqJqa
         /WqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084099; x=1792688899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EOjLYNLitfJIInUWIMI+uegThTaF0Q0MItF25km4ERw=;
        b=gfa7YwL3qiN7uyUx0uAm2mD4iRvUxONl0YLVvheLf1VLK741sgSGxo/0fM9utix7X+
         BK4X1H5s3Wa4OsbWNp9J7r6nQvkGJ/6p3PpZQbDcV3hgdod5NFSDSBc6i+FykwdEas2A
         kC3oxC4pNA9SQYXCqcE8ZeYqUPrgzGUz6WeXBjWJaxrUzv0zikmLdjDQyQOkbpd6Ei3l
         Rf332gcSCzYrxeUFeet5I8VkxAsYq1dkYpZBbb5gPEmKZp11UfpYcfpzWC9WkRRMJ2AR
         qfDxRLwS2iADDr3avaEETxu7fMeTJJQY1rzP4XtvD3rY5r7pPFS5Ve9GwS/2xZxs1pKn
         uczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084099; x=1792688899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOjLYNLitfJIInUWIMI+uegThTaF0Q0MItF25km4ERw=;
        b=YfNCB5Y80XMr12tsRg1OJsLeFurvUYgZvpPndoOBC53R9y/L3tvBORsenzXYnhLBr8
         cPTK5B/m8wdv436uOChwl90Q2litPt+4zoB+pz0BONB3emXR5hjF+yfWCL4wHn5ia3s6
         /GtKlbcbvGv+OYhrHu9TpmZn5AJABYb4OaMXgCIouQPX+Z9CxEtjyh71pKjTbkRznbXi
         RhXOwEp9bGyn4GTj6rPwfyvO885gw5Y7AcsiPLgORHd/iNyB83Vm+Fsgtt1qI6z9m2Mc
         vA9jOXMsiS3kPyKeej2P8JoS3ACng+2S31+NSx146oUTIuvr7Xwv41V3bWURPDeMZ62X
         ma4g==
X-Forwarded-Encrypted: i=1; AKwUvBw9CPhUMv9AC2j8ULXYdBtQs6TYItCIZUJoG41TaYzhJVuN3LvjdHMfauql+klyNhcq9whDVtOnMOyExw==@lists.infradead.org
X-Gm-Message-State: AFq9FYICmKIEyelEUsBF3i2qsOavki8VBsoE524E3ELCfCNt6tWqNJNf
	luy5inWag0qJD9JAQ02IhiNYM+lYMMaATXctjUFvrI/ZH7osuGM2Iy8CfvPgjg58bauNgEOCvAx
	f8W7KYKGjrVsGGixOUqe0PvWX2cw1KUY=
X-Gm-Gg: AYBFou316OKX3qnkqBvmZvZ93UGaq66lolXcZS/kSvd56A4vCJx92JT/5+nLvwF4HgK
	qMA45ojK0xZKs1+LVSi4cBzp6zaXeNr9f3SDX9U4AM51LBNkpevdEFkc4GGCd3aROAjgajCZBxU
	kuxi3fGbWN/r2vcMCbwxsl3d5gbZ0JmSedKaDGU0ENxPv76H5DYIvI6vlbi+p/L6fklD2bjCOOK
	SGwcPqsYBLUHQ1PBesDgsgNNhZtPoQDJ/yYR/8xKr2vIB43I7fgmWUwx+WkcMJJKTcbn1ekUSGb
	JYT1DJsBMgeZP6G/o0nvN0EWnkA2GNlJ8+CbtHkF+wC1dZN/ZEKGiOes
X-Received: by 2002:a05:690c:e681:10b0:88f:73b0:fa87 with SMTP id
 00721157ae682-8b07edb0e20mr57149977b3.11.1792084099608; Thu, 15 Oct 2026
 10:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
 <ar_Rathmoj2aP-H7@xhacker> <CALsPMBOYQbro2gZTQR=DSUowmVDs9kujH4ua2UzCoHAQrncuiw@mail.gmail.com>
 <asm95GdbmMpc81p3@xhacker> <CALsPMBPMHc7q-YZvqLLYDSr5RfLmDRwBSq-TFeB8Fc8bPBjQGg@mail.gmail.com>
 <as8NpaT0g9Tsl6PS@xhacker> <CALsPMBOdy4ZDWfnkYokUFuB3UYPV27wTUpBCZaxLWEV10ZuS=A@mail.gmail.com>
 <atAROTefufggiFPO@xhacker> <atBWGQ2iWpm2VKcY@xhacker>
In-Reply-To: <atBWGQ2iWpm2VKcY@xhacker>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Thu, 15 Oct 2026 19:08:08 +0200
X-Gm-Features: AclHuK_WwwJkKlFZfudhhQDlIMbwbspdMnarcp4gCr6CQeC65hQ3jIZC2-gsXTE
Message-ID: <CALsPMBPNKsnSAczyVm3LFFQjwRg8eiGgpB2hJN19iipRZ0mASA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_100820_952546_AE693769 
X-CRM114-Status: GOOD (  15.28  )
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

T24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgNjo0N+KAr0FNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAxNSwgMjAyNiBhdCAwNzozMzoxM0FN
ICswODAwLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMTQsIDIwMjYgYXQg
MDU6NTg6NDJQTSArMDIwMCwgUm9tYW4gU3Rvcm96aGVua28gd3JvdGU6Cj4gPiBJIHRoaW5rIHlv
dSBtaXN1bmRlcnN0b29kIHNvbWV0aGluZy4gQSByaXNjdiBwbGF0Zm9ybSB1c2VzIGVpdGhlcgo+
ID4gU0JJIFJGRU5DRSBvciBJUEkgZm9yIHRsYiBzaG9vdGRvd24sIGFuZCB3b24ndCBjaGFuZ2Uu
IFNvIHlvdSBjYW4KPiA+IGtub3cgd2hldGhlciB0aGUgc3lzdGVtIGlzIFNCSSBSRkVOQ0UgcG93
ZXJlZCBvciBJUEkgcG93ZXJlZCBieQo+ID4gY2F0IC9wcm9jL2ludGVycnVwdHMuIEl0J3MgbXVj
aCBzaW1wbGVyLgo+Cj4gQWhhLCBJIG1pc3NlZCBhY2xpbnQgc3N3aSBjYXNlLCBpZiBzc3dpLCBu
byBleHBsaWN0IC9wcm9jL2ludGVycnVwdHMKPiBkaWZmZXJlbmNlIGJldHdlZW4gc3N3aSBhbmQg
dHJhZGl0b25hbCBwbGljLiBIb3dldmVyLCB3aGV0aGVyIFRMQiBpcwo+IHBvd2VyZWQgYnkgU0JJ
IFJGRU5DRSBvciBJUEkgY2FuIHN0aWxsIGJlIGtub3duIGJ5IGNoZWNraW5nCj4gInByb3ZpZGlu
ZyBJUElzIHVzaW5nIFNCSSBJUEkgZXh0ZW5zaW9uIiBpbiBkbWVzZy4KClRoYW5rcywgSSBzZWUg
eW91ciBwb2ludCBub3cuCgpJIHdhcyB0cmVhdGluZyBTQkkgUkZFTkNFIHZzIHRoZSBMaW51eCBj
cm9zcy1DUFUgcGF0aCBhcyBwYXJ0IG9mIHRoZQpwZXItcmVxdWVzdCBzZWxlY3Rpb24sIGJ1dCB3
aXRoIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uCnJpc2N2X3NiaV9mb3JfcmZlbmNlIGlzIGVm
ZmVjdGl2ZWx5IGEgc3lzdGVtLXdpZGUgY2hvaWNlIGVzdGFibGlzaGVkCmR1cmluZyBpbml0aWFs
aXphdGlvbi4KCkkgcmV3b3JrZWQgdGhlIHBhdGNoIGluIHYzIGJhc2VkIG9uIHlvdXIgZmVlZGJh
Y2suIFRoZSB0cmFjZXBvaW50IG5vCmxvbmdlciByZXBvcnRzIHRoZSBsb2NhbC9TQkkgUkZFTkNF
L2Nyb3NzLUNQVSBpbXBsZW1lbnRhdGlvbiBwYXRoLgpJbnN0ZWFkLCBpdCBkZXNjcmliZXMgdGhl
IHNlbWFudGljIFRMQiBpbnZhbGlkYXRpb24gcmVxdWVzdCBpdHNlbGYsCmluY2x1ZGluZyB0aGUg
cmFuZ2UsIHN0cmlkZSwgQVNJRCwgdGFyZ2V0IENQVSBtYXNrIGFuZCByZXF1ZXN0IHNjb3BlLgoK
SSBzdGlsbCB0aGluayB0aGVyZSBpcyB2YWx1ZSBpbiBleHBvc2luZyB0aGlzIGluZm9ybWF0aW9u
IGFzIG9uZQpzZW1hbnRpYyBldmVudC4gVGhlIGluZGl2aWR1YWwgcGllY2VzIGNhbiBiZSByZWNv
bnN0cnVjdGVkIHdpdGggZHluYW1pYwp0cmFjaW5nLCBidXQgaGF2aW5nIHRoZW0gdG9nZXRoZXIg
bWFrZXMgaXQgc3RyYWlnaHRmb3J3YXJkIHRvIGFuYWx5emUKdGhlIGRpc3RyaWJ1dGlvbiBhbmQg
Y2hhcmFjdGVyaXN0aWNzIG9mIFRMQiBpbnZhbGlkYXRpb25zIGFjcm9zcyBhCndvcmtsb2FkIHdp
dGhvdXQgZGVwZW5kaW5nIG9uIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGRldGFpbHMuCgpU
aGUgdjMgcGF0Y2ggaXMgaGVyZToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MTAx
NS10bGJfdHJhY2Vwb2ludC12My0xLWVlZjMwNWEzYmI2M0BnbWFpbC5jb20vCgpUaGFua3MgZm9y
IHBvaW50aW5nIG91dCB0aGUgZGlzdGluY3Rpb24uIEl0IGhlbHBlZCBzaW1wbGlmeSB0aGUgZXZl
bnQKYW5kIG1ha2UgaXRzIGFic3RyYWN0aW9uIGNsZWFyZXIuCgotLSAKS2luZCByZWdhcmRzLApS
b21hbiAnSGVkaW4nIFN0b3JvemhlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
