Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEFFEB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5B2IBmPjsgD6+Df9cpqDM2hnIKoSI6sX68R1530Wl4=; b=XWbctPNQSuDLoY
	Uxp36U05/VDZC43ea+jk/3oTOM28U4ZuNO+kanxrE7XbOFehf/2dXghwngb5nQdmTQKDAkzQ1dtbc
	NvE1JXDZ53mGbTVPZ52gAGC1QaoyN9QbVX0v6u6bvLGs65pFKXIrfbAvVKXJ4jpkYizZDULRtHdC8
	9GgipeO00NnzvUbZs49ocNAyxFd/zLc0YsL+JL9gj0uwt44hn8Xqb67igW23zSR+iXDfgp8EuYcUd
	hdte0plZUXKOvJwrt8ECK/3ncmNjpxubNFiNLIh0r8p2V25puZc5/yKZRV9GXz5a2hjtFaki82af2
	blvMUOcUZ/wdkMjbGTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBtzE-00Dpbq-18;
	Wed, 21 Jun 2023 09:18:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBtzB-00DpbD-0K
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 09:18:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b55fc3a71cso18632185ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 02:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687339123; x=1689931123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pB2kKOyXmNJk2e2QsKOkbUZlQ9krtQWymG1tqTKND7M=;
        b=JEl+WD8TxC8kp5VqXUE8dKNh2/i7vnWvgiUcocUBtcvkMYbkJ/3i/v1xwcQI/dnAYD
         OocJ0aboXF1NcZDeOK+0y/eEiy2dSnUKH8qOOzAKez+JCw7tFekIKtwqCFhRfiNAKlLt
         q5+gV8VlyclcWMQHTWua5wpsF/9nEXJZj/nZagINJw6yXeij1vuicd7+vVmeUoHRt4If
         bnBpQ8XUnXOkoLSp2bYEahv6V/k4PyCu7yOSZCqc7nu5EzRWafvELH50E9xAkYQwv7Jn
         SJe9vOVGMBBXv8+yJMdaxMtks4idFDRhUSiJN05C/KeQ6BdmEBhTcbqL7PropsMzaMpq
         pqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687339123; x=1689931123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pB2kKOyXmNJk2e2QsKOkbUZlQ9krtQWymG1tqTKND7M=;
        b=h/cX6enGsfZnCbxsaxFoRrKUigkkjRRhyWte5q0Xri2XiW0ECY/cbBvQuqBYbcOKlF
         xA5B7SiasuMihO8lseA2bDviZTNOtxgnKd74M6iSv15TjWUktbyYREiFhoUrqP52WMzA
         DiuYCFu/ufD0XohzPi8dZoVcVsJR5VKCkrtY2XxnWPnldY5wGvVh5cMsUjY6KYSssrBV
         4MudFMlD19JDOeV0uHPaTn30ONU+ybG5crCjABH4Cdm3F6b21ZsCnrYo2wG6egGmV46G
         ZPScUpzwUE+FhEKbMu26+A/3HWpRaYfgZ4Es12/NcyS5JCel6FWCCEKYVnRg0qu0g5P+
         u2hw==
X-Gm-Message-State: AC+VfDwY67rSreiGc+CPGrvZIJBzJRboyktIXXHRyv7IqP5707bzon1D
	mSq11HYw6DMmeNz3ehMFbu4Tbg==
X-Google-Smtp-Source: ACHHUZ7Lr9AUWR6pAzVAfNdiplGzzD94FoKQ4yBkZgab3ADs+Jo6JR2/ENdEGi0ao1yboNbI01pSuQ==
X-Received: by 2002:a17:902:ce91:b0:1b6:8f1f:fc8d with SMTP id f17-20020a170902ce9100b001b68f1ffc8dmr2804577plg.0.1687339123052;
        Wed, 21 Jun 2023 02:18:43 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id n21-20020a170902969500b001ab1b7bae5asm3007337plp.184.2023.06.21.02.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 02:18:42 -0700 (PDT)
Date: Wed, 21 Jun 2023 14:48:35 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
Message-ID: <ZJLAa5AdJfHNJyPv@sunil-laptop>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
 <20230621072234.9900-2-alexghiti@rivosinc.com>
 <131BBACE35371733+d5902eda-c4ea-b74d-a17c-70fd1a166b6f@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <131BBACE35371733+d5902eda-c4ea-b74d-a17c-70fd1a166b6f@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_021845_165090_FEF38A87 
X-CRM114-Status: GOOD (  36.97  )
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

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMDQ6MTU6MDdQTSArMDgwMCwgU29uZyBTaHVhaSB3cm90
ZToKPiAKPiAKPiDlnKggMjAyMy82LzIxIDE1OjIyLCBBbGV4YW5kcmUgR2hpdGkg5YaZ6YGTOgo+
ID4gVGhpcyBkb2N1bWVudCBkZXNjcmliZXMgdGhlIGNvbnN0cmFpbnRzIGFuZCByZXF1aXJlbWVu
dHMgb2YgdGhlIGVhcmx5Cj4gPiBib290IHByb2Nlc3MgaW4gYSBSSVNDLVYga2VybmVsLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5j
b20+Cj4gPiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+
ID4gLS0tCj4gPiAgIERvY3VtZW50YXRpb24vcmlzY3YvYm9vdC1pbWFnZS1oZWFkZXIucnN0IHwg
ICAzIC0KPiA+ICAgRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LnJzdCAgICAgICAgICAgICAgfCAx
NzAgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gICBEb2N1bWVudGF0aW9uL3Jpc2N2L2luZGV4
LnJzdCAgICAgICAgICAgICB8ICAgMSArCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTcxIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL3Jpc2N2L2Jvb3QucnN0Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJzdCBiL0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC1p
bWFnZS1oZWFkZXIucnN0Cj4gPiBpbmRleCBkNzc1MjUzMzg2NWYuLmE0YTQ1MzEwYzRjNCAxMDA2
NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC1pbWFnZS1oZWFkZXIucnN0Cj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJzdAo+ID4gQEAg
LTcsOSArNyw2IEBAIEJvb3QgaW1hZ2UgaGVhZGVyIGluIFJJU0MtViBMaW51eAo+ID4gICBUaGlz
IGRvY3VtZW50IG9ubHkgZGVzY3JpYmVzIHRoZSBib290IGltYWdlIGhlYWRlciBkZXRhaWxzIGZv
ciBSSVNDLVYgTGludXguCj4gPiAtVE9ETzoKPiA+IC0gIFdyaXRlIGEgY29tcGxldGUgYm9vdGlu
ZyBndWlkZS4KPiA+IC0KPiA+ICAgVGhlIGZvbGxvd2luZyA2NC1ieXRlIGhlYWRlciBpcyBwcmVz
ZW50IGluIGRlY29tcHJlc3NlZCBMaW51eCBrZXJuZWwgaW1hZ2U6Ogo+ID4gICAJdTMyIGNvZGUw
OwkJICAvKiBFeGVjdXRhYmxlIGNvZGUgKi8KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3Jpc2N2L2Jvb3QucnN0IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LnJzdAo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMDE5ZWU4MTg2ODZkCj4gPiAt
LS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QucnN0Cj4gPiBA
QCAtMCwwICsxLDE3MCBAQAo+ID4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
Cj4gPiArCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KPiA+ICtSSVNDLVYgS2VybmVsIEJvb3QgUmVxdWlyZW1lbnRzIGFuZCBDb25zdHJhaW50cwo+
ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiAr
Cj4gPiArOkF1dGhvcjogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+
ID4gKzpEYXRlOiAyMyBNYXkgMjAyMwo+ID4gKwo+ID4gK1RoaXMgZG9jdW1lbnQgZGVzY3JpYmVz
IHdoYXQgdGhlIFJJU0MtViBrZXJuZWwgZXhwZWN0cyBmcm9tIGJvb3Rsb2FkZXJzIGFuZAo+ID4g
K2Zpcm13YXJlLCBidXQgYWxzbyB0aGUgY29uc3RyYWludHMgdGhhdCBhbnkgZGV2ZWxvcGVyIG11
c3QgaGF2ZSBpbiBtaW5kIHdoZW4KPiA+ICt0b3VjaGluZyB0aGUgZWFybHkgYm9vdCBwcm9jZXNz
LiBGb3IgdGhlIHB1cnBvc2VzIG9mIHRoaXMgZG9jdW1lbnQsIHRoZQo+ID4gKydlYXJseSBib290
IHByb2Nlc3MnIHJlZmVycyB0byBhbnkgY29kZSB0aGF0IHJ1bnMgYmVmb3JlIHRoZSBmaW5hbCB2
aXJ0dWFsCj4gPiArbWFwcGluZyBpcyBzZXQgdXAuCj4gPiArCj4gPiArUHJlLWtlcm5lbCBSZXF1
aXJlbWVudHMgYW5kIENvbnN0cmFpbnRzCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4gPiArCj4gPiArVGhlIFJJU0MtViBrZXJuZWwgZXhwZWN0cyB0aGUgZm9s
bG93aW5nIG9mIGJvb3Rsb2FkZXJzIGFuZCBwbGF0Zm9ybSBmaXJtd2FyZToKPiA+ICsKPiA+ICtS
ZWdpc3RlciBzdGF0ZQo+ID4gKy0tLS0tLS0tLS0tLS0tCj4gPiArCj4gPiArVGhlIFJJU0MtViBr
ZXJuZWwgZXhwZWN0czoKPiA+ICsKPiA+ICsgICogYCRhMGAgdG8gY29udGFpbiB0aGUgaGFydGlk
IG9mIHRoZSBjdXJyZW50IGNvcmUuCj4gPiArICAqIGAkYTFgIHRvIGNvbnRhaW4gdGhlIGFkZHJl
c3Mgb2YgdGhlIGRldmljZXRyZWUgaW4gbWVtb3J5Lgo+ID4gKwo+ID4gK0NTUiBzdGF0ZQo+ID4g
Ky0tLS0tLS0tLQo+ID4gKwo+ID4gK1RoZSBSSVNDLVYga2VybmVsIGV4cGVjdHM6Cj4gPiArCj4g
PiArICAqIGAkc2F0cCA9IDBgOiB0aGUgTU1VLCBpZiBwcmVzZW50LCBtdXN0IGJlIGRpc2FibGVk
Lgo+ID4gKwo+ID4gK1Jlc2VydmVkIG1lbW9yeSBmb3IgcmVzaWRlbnQgZmlybXdhcmUKPiA+ICst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiArCj4gPiArVGhlIFJJU0Mt
ViBrZXJuZWwgbXVzdCBub3QgbWFwIGFueSByZXNpZGVudCBtZW1vcnksIG9yIG1lbW9yeSBwcm90
ZWN0ZWQgd2l0aAo+ID4gK1BNUHMsIGluIHRoZSBkaXJlY3QgbWFwcGluZywgc28gdGhlIGZpcm13
YXJlIG11c3QgY29ycmVjdGx5IG1hcmsgdGhvc2UgcmVnaW9ucwo+ID4gK2FzIHBlciB0aGUgZGV2
aWNldHJlZcKgc3BlY2lmaWNhdGlvbiBhbmQvb3IgdGhlIFVFRkkgc3BlY2lmaWNhdGlvbi4KPiA+
ICsKPiA+ICtLZXJuZWwgbG9jYXRpb24KPiA+ICstLS0tLS0tLS0tLS0tLS0KPiA+ICsKPiA+ICtU
aGUgUklTQy1WIGtlcm5lbCBleHBlY3RzIHRvIGJlIHBsYWNlZCBhdCBhIFBNRCBib3VuZGFyeSAo
Mk1CIGFsaWduZWQgZm9yIHJ2NjQKPiA+ICthbmQgNE1CIGFsaWduZWQgZm9yIHJ2MzIpLiBOb3Rl
IHRoYXQgdGhlIEVGSSBzdHViIHdpbGwgcGh5c2ljYWxseSByZWxvY2F0ZSB0aGUKPiA+ICtrZXJu
ZWwgaWYgdGhhdCdzIG5vdCB0aGUgY2FzZS4KPiA+ICsKPiA+ICtIYXJkd2FyZSBkZXNjcmlwdGlv
bgo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiArCj4gPiArVGhlIGZpcm13YXJlIGNhbiBw
YXNzIGVpdGhlciBhIGRldmljZXRyZWUgb3IgQUNQSSB0YWJsZXMgdG8gdGhlIFJJU0MtViBrZXJu
ZWwuCj4gPiArCj4gPiArVGhlIGRldmljZXRyZWUgaXMgZWl0aGVyIHBhc3NlZCBkaXJlY3RseSB0
byB0aGUga2VybmVsIGZyb20gdGhlIHByZXZpb3VzIHN0YWdlCj4gPiArdXNpbmcgdGhlIGAkYTFg
IHJlZ2lzdGVyLCBvciB3aGVuIGJvb3Rpbmcgd2l0aCBVRUZJLCBpdCBjYW4gYmUgcGFzc2VkIHVz
aW5nIHRoZQo+ID4gK0VGSSBjb25maWd1cmF0aW9uIHRhYmxlLgo+ID4gKwo+ID4gK1RoZSBBQ1BJ
IHRhYmxlcyBhcmUgcGFzc2VkIHRvIHRoZSBrZXJuZWwgdXNpbmcgdGhlIEVGSSBjb25maWd1cmF0
aW9uIHRhYmxlLiBJbgo+ID4gK3RoaXMgY2FzZSwgYSB0aW55IGRldmljZXRyZWUgaXMgc3RpbGwg
Y3JlYXRlZCBieSB0aGUgRUZJIHN0dWIuIFBsZWFzZSByZWZlciB0bwo+ID4gKyJFRkkgc3R1YiBh
bmQgZGV2aWNldHJlZSIgdHJlZSBzZWN0aW9uIGJlbG93IGZvciBkZXRhaWxzIGFib3V0IHRoaXMg
ZGV2aWNldHJlZS4KPiA+ICsKPiA+ICtLZXJuZWwgZW50cmFuY2UKPiA+ICstLS0tLS0tLS0tLS0t
LS0KPiA+ICsKPiA+ICtPbiBTTVAgc3lzdGVtcywgdGhlcmUgYXJlIDIgbWV0aG9kcyB0byBlbnRl
ciB0aGUga2VybmVsOgo+ID4gKwo+ID4gKy0gYFJJU0NWX0JPT1RfU1BJTldBSVRgOiB0aGUgZmly
bXdhcmUgcmVsZWFzZXMgYWxsIGhhcnRzIGluIHRoZSBrZXJuZWwsIG9uZSBoYXJ0Cj4gPiArICB3
aW5zIGEgbG90dGVyeSBhbmQgZXhlY3V0ZXMgdGhlIGVhcmx5IGJvb3QgY29kZSB3aGlsZSB0aGUg
b3RoZXIgaGFydHMgYXJlCj4gPiArICBwYXJrZWQgd2FpdGluZyBmb3IgdGhlIGluaXRpYWxpemF0
aW9uIHRvIGZpbmlzaC4gVGhpcyBtZXRob2QgaXMgbW9zdGx5IHVzZWQgdG8KPiA+ICsgIHN1cHBv
cnQgb2xkZXIgZmlybXdhcmVzIHdpdGhvdXQgU0JJIEhTTSBleHRlbnNpb24gYW5kIE0tbW9kZSBS
SVNDLVYga2VybmVsLgo+ID4gKy0gYE9yZGVyZWQgYm9vdGluZ2A6IHRoZSBmaXJtd2FyZSByZWxl
YXNlcyBvbmx5IG9uZSBoYXJ0IHRoYXQgd2lsbCBleGVjdXRlIHRoZQo+ID4gKyAgaW5pdGlhbGl6
YXRpb24gcGhhc2UgYW5kIHRoZW4gd2lsbCBzdGFydCBhbGwgb3RoZXIgaGFydHMgdXNpbmcgdGhl
IFNCSSBIU00KPiA+ICsgIGV4dGVuc2lvbi4gVGhlIG9yZGVyZWQgYm9vdGluZyBtZXRob2QgaXMg
dGhlIHByZWZlcnJlZCBib290aW5nIG1ldGhvZCBmb3IKPiA+ICsgIGJvb3RpbmcgdGhlIFJJU0Mt
ViBrZXJuZWwgYmVjYXVzZSBpdCBjYW4gc3VwcG9ydCBjcHUgaG90cGx1ZyBhbmQga2V4ZWMuCj4g
PiArCj4gPiArVUVGSQo+ID4gKy0tLS0KPiA+ICsKPiA+ICtVRUZJIG1lbW9yeSBtYXAKPiA+ICt+
fn5+fn5+fn5+fn5+fn4KPiA+ICsKPiA+ICtXaGVuIGJvb3Rpbmcgd2l0aCBVRUZJLCB0aGUgUklT
Qy1WIGtlcm5lbCB3aWxsIHVzZSBvbmx5IHRoZSBFRkkgbWVtb3J5IG1hcCB0bwo+ID4gK3BvcHVs
YXRlIHRoZSBzeXN0ZW0gbWVtb3J5Lgo+ID4gKwo+ID4gK1RoZSBVRUZJIGZpcm13YXJlIG11c3Qg
cGFyc2UgdGhlIHN1Ym5vZGVzIG9mIHRoZSBgL3Jlc2VydmVkLW1lbW9yeWAgZGV2aWNldHJlZQo+
ID4gK25vZGUgYW5kIGFiaWRlIGJ5IHRoZSBkZXZpY2V0cmVlIHNwZWNpZmljYXRpb24gdG8gY29u
dmVydCB0aGUgYXR0cmlidXRlcyBvZgo+ID4gK3Rob3NlIHN1Ym5vZGVzIChgbm8tbWFwYCBhbmQg
YHJldXNhYmxlYCkgaW50byB0aGVpciBjb3JyZWN0IEVGSSBlcXVpdmFsZW50Cj4gPiArKHJlZmVy
IHRvIHNlY3Rpb24gIjMuNS40IC9yZXNlcnZlZC1tZW1vcnkgYW5kIFVFRkkiIG9mIHRoZSBkZXZp
Y2V0cmVlCj4gPiArc3BlY2lmaWNhdGlvbiB2MC40LXJjMSkuCj4gYXBwZW5kIHRoaXMgbm90ZSA/
Cj4gCj4gTm90ZSB0aGF0IFJJU0MtViBlZGsyIGRpdmVyZ2VzIGZyb20gdGhlIGRldmljZXRyZWUg
c3BlY2lmaWNhdGlvbiB0byBkZWNsYXJlCj4gdGhlICFuby1tYXAgcmVnaW9ucyBhcyBFZmlSZXNl
cnZlZE1lbW9yeVR5cGUgaW5zdGVhZCBvZiBFZmlCb290U2VydmljZXNEYXRhLgo+ID4gKwpOb3Qg
cmVxdWlyZWQuIEl0IHdpbGwgYmUgZml4ZWQgaW4gRURLMi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
