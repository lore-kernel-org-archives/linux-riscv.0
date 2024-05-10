Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1285C25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaJCKnWdcyuN9Pi2x8DpE+2/Y1xcs+ZeZsGoATNqyZU=; b=maG17kemGZetM/
	DRMecszswdiBI0e6l93Wlo6IIzR6IfJuwUoeQz2ORQtZKT2t4czrXHjoW+/VvEf1XKqUkRSuWL5yv
	m5enfeYBPDpTlWUk6pciJm7S87RzTxoLgq71IQyx72eJ1n0ZE9bmolLRZk7gIpuZF7z2uif0fguMz
	v+PW69+5OdssK1G7IbUar6+ydR1UHQnctucyJp9KBsgghqa50U804J2DmpPH+aYZAwUytV+RATCoC
	EjJpEaUPg5IDfBEm2Sq0NY6T/YD8yVm8nFyVkpb49mS4o9c7qaIo57L4iswZjlvZ/FROR9LqCtUry
	+Ja1uWTdJNgtr/euUM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MGI-00000004b7E-2Iw9;
	Fri, 10 May 2024 09:09:54 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MGD-00000004b2G-2OGo
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 09:09:52 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6ef98eee195so476349a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 02:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1715332180; x=1715936980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yIdtQp3ur1f9Zjf3zmNi4wTquzd2hcg9pPvEGak2SI=;
        b=Qez+ehxc9VMkLlrAdHhWIJtNUf1lafndLPZnMbuQVgB0BdTxHxpBTcAWQaqJLGLYGx
         MaXTFMurjvblfeUE4LPovuEFMXYxkj0iGP9RkaPHqua8SuWU34i3P9OlSn+TPvrsO5To
         anUQhtxusoVa6LpMqnUBblCDhJ8yWB1bj71axfG4NEuAIV+Yqsklcz+buHXoWGNV77XG
         sNtJwf0OJi7K5CV4vL6fGEOfonAIwNg/i7UGaLGMg+QGO44eEPOWSEYFzxhxFoFwKE7u
         LdTSWqSWnkD55yiHDJM4kB2TC1LT+Iwwa4pR2dLEV5XUqNc/HwP8iW9QZ7uO3raNLj02
         RLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715332180; x=1715936980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yIdtQp3ur1f9Zjf3zmNi4wTquzd2hcg9pPvEGak2SI=;
        b=NC955iOX3QTt1gTxTIUCq94+Ix52Ue0WdrZuQ4Td+cgZABuYdwH3qPKESOQDxEH/Mv
         /0fM3lpywUtkvX/9Ddui8zwQ/GbWRuLE6C2ZZmsbleMPwF9fzzgUG2RObDZ/DrmJXeBy
         0RGpjvpmVHSjogCEN52c+GY7O1isVuadJuWpk9JG+zLwcmt9oZ2PtrPL8P7PnTjx5YIu
         gi71G+LkflqVMt3DpoiTQc+SEVUfzpYTLWXPsXWB8EoLerqhs8RThpfNmw4lUAgWfAtb
         RqvpKjQY0SzAFOS4KKQcNpZ4GFUBeZliB1JwVubsTxhgfxUhcBFZ4k53u/u4qORwCmux
         AodA==
X-Forwarded-Encrypted: i=1; AJvYcCXAN0zHOfZSitNIMsdqPLjw1HDcP0Lgmexgc18dtBxK8yw4yjTmvqauzqMxtT3C7skvrOfQRNYo32lG7yHDpRuLG5X2mqqI4LBTF+9LszGf
X-Gm-Message-State: AOJu0Yxzp2wvITCuP3DQt29AlhjuaDAxQwhRdQ3u7owHrkiHD3ZDPouJ
	b7U5xl+q5sSSBq2Emof8OlaQAMyix+1cIFvscgU5Z0mjA3YPJwLYnYOXNAmBNU7HTamBt/T5lJ6
	toSkiqR1XZNbDbMPqYozfvk9r9rRrxSAgRQtKrQ==
X-Google-Smtp-Source: AGHT+IFJUZsn5cCFuDu7+oE0uV3M2KrJJj2xWvL4ycCzP3mzWGKzZ6Zvm6RZSzXcZCEZoX2rhgdaX1mskMRMuYwjnB4=
X-Received: by 2002:a05:6870:6387:b0:233:5f71:4461 with SMTP id
 586e51a60fabf-24172fc60b6mr2387986fac.55.1715332179485; Fri, 10 May 2024
 02:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240509073300.4968-1-cuiyunhui@bytedance.com>
 <20240509073300.4968-2-cuiyunhui@bytedance.com> <ZjzrXnOc5AAost4O@bogus>
In-Reply-To: <ZjzrXnOc5AAost4O@bogus>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 10 May 2024 17:09:28 +0800
Message-ID: <CAEEQ3wkHc-EaRPKLivZoxO6jKXv9bigbYhacWouL7+KbgbwWpQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
To: Sudeep Holla <sudeep.holla@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_020949_630807_AE7AD277 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu, rafael@kernel.org, jhugo@codeaurora.org, tiantao6@huawei.com, john.garry@huawei.com, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, linux-acpi@vger.kernel.org, pierre.gondois@arm.com, james.morse@arm.com, Jonathan.Cameron@huawei.com, paul.walmsley@sifive.com, bhelgaas@google.com, linux-riscv@lists.infradead.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLAoKVGhlcmUgYXJlIGFscmVhZHkgcmVsYXRlZCBSZXZpZXdlZC1ieSwgR2VudGxl
IHBpbmcuLi4KCk9uIFRodSwgTWF5IDksIDIwMjQgYXQgMTE6MjfigK9QTSBTdWRlZXAgSG9sbGEg
PHN1ZGVlcC5ob2xsYUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDA5LCAyMDI0IGF0
IDAzOjMyOjU5UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBCZWZvcmUgY2FjaGVpbmZv
IGNhbiBiZSBidWlsdCBjb3JyZWN0bHksIHdlIG5lZWQgdG8gaW5pdGlhbGl6ZSBsZXZlbAo+ID4g
YW5kIHR5cGUuIFNpbmNlIFJJU0MtViBjdXJyZW50bHkgZG9lcyBub3QgaGF2ZSBhIHJlZ2lzdGVy
IGdyb3VwIHRoYXQKPiA+IGRlc2NyaWJlcyBjYWNoZS1yZWxhdGVkIGF0dHJpYnV0ZXMgbGlrZSBB
Uk02NCwgd2UgY2Fubm90IG9idGFpbiB0aGVtCj4gPiBkaXJlY3RseSwgc28gbm93IHdlIG9idGFp
biBjYWNoZSBsZWF2ZXMgZnJvbSB0aGUgQUNQSSBQUFRUIHRhYmxlCj4gPiAoYWNwaV9nZXRfY2Fj
aGVfaW5mbygpKSBhbmQgc2V0IHRoZSBjYWNoZSB0eXBlIHRocm91Z2ggc3BsaXRfbGV2ZWxzLgo+
ID4KPiA+IFN1Z2dlc3RlZC1ieTogSmVyZW15IExpbnRvbiA8amVyZW15LmxpbnRvbkBhcm0uY29t
Pgo+ID4gU3VnZ2VzdGVkLWJ5OiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xsYUBhcm0uY29tPgo+
Cj4gSSBhbSBub3Qgc3VyZSB3aHkgeW91IGhhdmUgbm90IGFkZGVkIG15IHJldmlld2VkLWJ5IGFz
IEkgd2FzIGhhcHB5IHdpdGgKPiB2MyBvbndhcmRzIElJUkMuIEFueXdheXMsIEkgd2lsbCBnaXZl
IGl0IGFnYWluIPCfmIQKPgo+IFJldmlld2VkLWJ5OiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xs
YUBhcm0uY29tPgo+Cj4gLS0KPiBSZWdhcmRzLAo+IFN1ZGVlcAoKVGhhbmtz77yMCll1bmh1aQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
