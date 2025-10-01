Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82CECAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 03:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNTA85tYzq5pzwCFzWk6oKlYjM2Mg1fBAawd4GnFL3Q=; b=sNW9tTuL1t/s8w
	DqvG24ewmII+3boU2TSxT98E3nDUz7fWIs9AD07StUSJJdxd3tdEdnjdhx+Xy9tqrpOcccQ/2+win
	fdv3svCnuVGAHVqXFMBckl7XlXHLnsk0b6+H5AaHrPu7QORVNxo2fUsqrdSibpKBQG+QDMGAM5bY/
	kb4Md3+jAWpWVd+XXNMcak5UZQMEeO6MuyY33v9Wb9Dzhxwoj6SAhmtLcyXNXRz9B9ZASdyZrp4Y4
	c6jqunVYFYsAgFh+7lrkaUWvje7YAdorTrodjmCJOjxIYn+yx7LHLRzjoTyRaVgoLttQrHXV89ooe
	gREjbBLAtTv10QFOh3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3npd-00000006eES-43s3;
	Wed, 01 Oct 2025 03:48:45 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3npb-00000006eDf-2KVg
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 03:48:45 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-58984c363ceso515899e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 20:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759290521; x=1759895321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbDGpgTcV4nPy99Bde42+h9SYqbXF4/JT7azRtjchCw=;
        b=GpqFjlOs595FPqbvcrq0r7UsUlKw03NvM28ysbC+d6kMMshw8sgYoR7nm8iE0iv4xN
         LV0hyy0wudqU3pdVbeZxDNlyJPLqC3FNr/5O1HWzgMpvwvXLYsr5kXdtPXI/RXz/6DWa
         4eTK3pndoGHI/1ar9YZZYBUZDbRyJYTHes5vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759290521; x=1759895321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbDGpgTcV4nPy99Bde42+h9SYqbXF4/JT7azRtjchCw=;
        b=sE774bZp88O+QELPYSjli4V57kleU7LoLtP0xTLYicmkMfYKML4VQ2Tt9LZGC9Y71n
         krSujkMrHkqtthORgDTGFTUVHGj6W085N0F1ADx6klEPnnEch+YMGKBWAlYlQSoJRvdw
         7/DQzUUTeBqGu/Jg8PJxQAklArNrNM+n6wcsU1RCrpquHgp/ed+THGf3/43E7iQ9GiRa
         iftvApF+iAiocN+qzHvOHKaYTQ5Sbok9t5Rrsiaos136gTEMmoLpGugHBckm/sJ/gulP
         ks1hnMppYPgjdJQIiluqdAoLdko7bC8Xg7TxblOY9YAZS0LkJ7yPCpbjosPy50yZyC5+
         Qduw==
X-Forwarded-Encrypted: i=1; AJvYcCXwqT5+ZtgmSJaeXH5UbE2fjr8y4IVvm6SIYU9RB1GtiGSJbVZXJ6hTKMkqI5AIbjty1XzdwO/TLsLpuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ/0tlnCZuFz+9oEeA2eyRxlXN6eIxkN8e0ood8KEefT2DjYTT
	x+OkZoy4MIFdoAmgglE7ZxkNoTiiwG82AWCdrXrF5rTFJGEYOtlJTfghGJSl3dUfVIXRx2Jb7yU
	E1+boxnm97FfWkloFGnpYiFhFyq3l+0sqQBJfmjOA
X-Gm-Gg: ASbGncuiP+1OrXl+L/BD4LUQXFX9ooUTcRl/+uO3pQt6qwvZVNZZr0k2DPFbde1YTxZ
	mj+vK0Xo6ABqRyUC+M9J5id2PTtbtRAL/z4Hi5HlpImHHBeafD6lSvzRMKZ0k/fnF+C3Gwg7FG0
	OicTmdB77BOysa7Dd4QZvU0oM1N0YPExcAwx1jJMOFXEPmgG3FZQMDm69ChkOfGNXuAZuTRyIAQ
	CFHa4xnSPjyak7Wwf0pxHmZQ9ZCZj3yoQo9LBDV7vdMG/2xPIS8XSw6zggbkQ==
X-Google-Smtp-Source: AGHT+IEt27GdUNuEil1oCZ0SLhwUHChkXL8gmJhktqVVplGqcGKrSSp67qADibM4PY5Cnx6ufacc+rJwkmcCX3eGhbM=
X-Received: by 2002:a05:6512:6181:b0:577:a108:93ca with SMTP id
 2adb3069b0e04-58984e225bbmr1821361e87.28.1759290520880; Tue, 30 Sep 2025
 20:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
In-Reply-To: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Oct 2025 11:48:30 +0800
X-Gm-Features: AS18NWDDl3OS7A4mcJKeQv_2tDSls1y22vmY0gN81pxraCtuEd9IP-mkQAX3bNg
Message-ID: <CAGXv+5FQSETv62FS32=eadBWwZPB_ShaJ3_P0cksnL=sdBwkFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add board-id support for multiple DT selection
To: Amrit Anand <quic_amrianan@quicinc.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org, 
	caleb.connolly@linaro.org, linux-riscv@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_204843_808236_A682B50D 
X-CRM114-Status: GOOD (  24.22  )
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

SGkgQW1yaXQsCgpPbiBUaHUsIE1hciAxNCwgMjAyNCBhdCA4OjEz4oCvUE0gQW1yaXQgQW5hbmQg
PHF1aWNfYW1yaWFuYW5AcXVpY2luYy5jb20+IHdyb3RlOgo+Cj4gVGhlIHNvZnR3YXJlIHBhY2th
Z2VzIGFyZSBzaGlwcGVkIHdpdGggbXVsdGlwbGUgZGV2aWNlIHRyZWUgYmxvYnMgc3VwcG9ydGlu
Zwo+IG11bHRpcGxlIGJvYXJkcy4gRm9yIGluc3RhbmNlLCBzdXBwb3NlIHdlIGhhdmUgMyBTb0Ms
IGVhY2ggd2l0aCA0IGJvYXJkcyBzdXBwb3J0ZWQsCj4gYWxvbmcgd2l0aCAyIFBNSUMgc3VwcG9y
dCBmb3IgZWFjaCBjYXNlIHdoaWNoIHdvdWxkIGxlYWQgdG8gdG90YWwgb2YgMjQgRFRCIGZpbGVz
Lgo+IEFsb25nIHdpdGggdGhlc2UgY29uZmlndXJhdGlvbnMsIE9FTXMgbWF5IGFsc28gYWRkIGNl
cnRhaW4gYWRkaXRpb25hbCBib2FyZCB2YXJpYW50cy4KPiBIZW5jZSwgYSBtZWNoYW5pc20gaXMg
cmVxdWlyZWQgdG8gcGljayB0aGUgY29ycmVjdCBEVEIgZm9yIHRoZSBib2FyZCBvbiB3aGljaCB0
aGUKPiBzb2Z0d2FyZSBwYWNrYWdlIGlzIGRlcGxveWVkLiBJbnRyb2R1Y2UgYSB1bmlxdWUgcHJv
cGVydHkgZm9yIGFkZGluZyBib2FyZCBpZGVudGlmaWVycwo+IHRvIGRldmljZSB0cmVlcy4gSGVy
ZSwgYm9hcmQtaWQgcHJvcGVydHkgcHJvdmlkZXMgYSBtZWNoYW5pc20gZm9yIFF1YWxjb21tIGJh
c2VkCj4gYm9vdGxvYWRlcnMgdG8gc2VsZWN0IHRoZSBhcHByb3ByaWF0ZSBEVEIuCj4KPiBJc24n
dCB0aGF0IHdoYXQgdGhlIGNvbXBhdGlibGUgcHJvcGVydHkgaXMgZm9yPwo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gVGhlIGNvbXBhdGlibGUgcHJv
cGVydHkgY2FuIGJlIHVzZWQgZm9yIGJvYXJkIG1hdGNoaW5nLCBidXQgcmVxdWlyZXMKPiBib290
bG9hZGVycyBhbmQvb3IgZmlybXdhcmUgdG8gbWFpbnRhaW4gYSBkYXRhYmFzZSBvZiBwb3NzaWJs
ZSBzdHJpbmdzCj4gdG8gbWF0Y2ggYWdhaW5zdCBvciBoYXZlIGNvbXBsZXggY29tcGF0aWJsZSBz
dHJpbmcgcGFyc2luZyBhbmQgbWF0Y2hpbmcuCj4gQ29tcGF0aWJsZSBzdHJpbmcgbWF0Y2hpbmcg
YmVjb21lcyBjb21wbGljYXRlZCB3aGVuIHRoZXJlIGFyZSBtdWx0aXBsZQo+IHZlcnNpb25zIG9m
IHRoZSBzYW1lIGJvYXJkLiBJdCBiZWNvbWVzIGRpZmZpY3VsdCBmb3IgdGhlIGRldmljZSB0cmVl
Cj4gc2VsZWN0aW9uIG1lY2hhbmlzbSB0byByZWNvZ25pemUgdGhlIHJpZ2h0IERUQiB0byBwaWNr
LCB3aXRoIG1pbm9yCj4gZGlmZmVyZW5jZXMgaW4gY29tcGF0aWJsZSBzdHJpbmdzLgoKSSBwbGFu
IHRvIHJldmlzaXQgdGhpcyB0b3BpYywgYW5kIGFsc28gaW5jbHVkZSBkZXZpY2UgdHJlZSBvdmVy
bGF5IHNlbGVjdGlvbiwKYXQgUGx1bWJlcnMgdGhpcyB5ZWFyLiBJIHdhcyB3b25kZXJpbmcgaWYg
dGhlcmUgd2FzIGFueSBwcm9ncmVzcyBvciBjaGFuZ2VzCm9uIHlvdXIgZW5kPwoKVGhhbmtzCkNo
ZW5ZdQoKPiBUaGUgc29sdXRpb24gcHJvcG9zZWQgaGVyZSBpcyBzaW1wbGVyIHRvIGltcGxlbWVu
dCBhbmQgZG9lc24ndCByZXF1aXJlIHRoZSBuZWVkCj4gdG8gdXBkYXRlIGJvb3Rsb2FkZXIgZm9y
IGV2ZXJ5IG5ldyBib2FyZC4KPgo+IEhvdyBpcyB0aGlzIGJldHRlciB0aGFuIFF1YWxjb21tJ3Mg
cWNvbSxtc20taWQvcWNvbSxib2FyZC1pZD8KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gUXVhbGNvbW0ncyBxY29tLG1zbS1p
ZC9xY29tLGJvYXJkLWlkIGFyZSBub3Qgc2NhbGFibGUgZm9yIG90aGVyIGRpc3Rpbmd1aXNoaW5n
Cj4gZmVhdHVyZXMgYXMgd2UgbmVlZCB0byBhZGQgYSBuZXcgcHJvcGVydHkgZXZlcnkgdGltZS4g
Qm9hcmQtaWQgcHJvcGVydHkgcHJvdmlkZQo+IGEgc29sdXRpb24gdGhhdCB0aGUgYm9vdGxvYWRl
ciBjYW4gdXNlIHRvIHNlbGVjdCBhcHByb3ByaWF0ZSBkZXZpY2UgdHJlZS4gQm9hcmQtaWQKPiBl
bmNhcHN1bGF0ZXMgc29jLCBib2FyZCwgcG1pYyBhbmQgb2VtIGlkZW50aWZpZXJzLiBRdWFsY29t
bSBiYXNlZCBib290bG9hZGVyIGNhbiB1c2UKPiB0aGVzZSBrZXktdmFsdWUgcGFpcnMgdG8gdW5p
cXVlbHkgaWRlbnRpZnkgdGhlIGRldmljZSB0cmVlLiBUaGlzIHNvbHV0aW9uIHNjYWxlcyB3ZWxs
Cj4gZm9yIGNhc2VzIHdoZXJlIGFkZGl0aW9uYWwgaWRlbnRpZmllcnMgd291bGQgYmUgbmVlZGVk
IGZvciBkZXZpY2UgdHJlZSBzZWxlY3Rpb24KPiBjcml0ZXJpYS4gQWRkaW5nIGEgbmV3IHR1cGxl
IGluICJib2FyZC1pZCIgYWxvbmcgd2l0aCAiYm9hcmQtaWQtdHlwZSIgd2lsbCBoZWxwIHN1cHBv
cnQgaXQuCj4KPiBDaGFuZ2VzIGluIFYyOgo+ICAtIEJhc2VkIG9uIGNvbW1lbnQgb24gVjEgcmVs
YXRlZCB0byBjaGFsbGVuZ2VzIG9uIGRlc2lnbmluZyBjb21tb24gYm9vdGxvYWRlciBmb3IgYWxs
Cj4gICAgdGhlIHZlbmRvcnMsIHdoZXJlIGRpZmZlcmVudCB2ZW5kb3JzIGNhbiBoYXZlIGRpZmZl
cmVudCByZXByZXNlbnRhdGlvbiBvZiBib2FyZC1pZAo+ICAgIGFuZCB0aGUgYmVzdCBhbmQgZXhh
Y3QgbWF0Y2ggbG9naWMgY2FuIGFsc28gYmUgZGlmZmVyZW50IGZvciBkaWZmZXJlbnQgdmVuZG9y
cywgbW92aW5nCj4gICAgdGhlIGJvYXJkLWlkIGRlZmluaXRpb24gaW4gcWNvbSBzcGVjaWZpYyBi
aW5kaW5nLgo+ICAtIEFkZGluZyBzdXBwb3J0IGZvciBib2FyZCBJRHMgZm9yIGFsbCB0aGUgYm9h
cmRzIHRoYXQgYXJlIGluIGtlcm5lbC5vcmcuCj4gIC0gQWRkaW5nIFF1YWxjb21tIGJvb3Rsb2Fk
ZXIgYmVzdC9leGFjdCBtYXRjaCBsb2dpYyBmb3IgbXVsdGkgRFQgc2VsZWN0aW9uLgo+ICAtIEtl
ZXBpbmcgbGlzdCBvZiBvdGhlciB2ZW5kb3JzIGluIENDIGZvciBjb21tZW50L2F3YXJlbmVzcyBy
ZWxhdGVkIHRvIHRoaXMgcmVxdWlyZW1lbnQKPiAgLSBMaW5rIHRvIFYxOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMTcwNTc0OTY0OS00NzA4LTEtZ2l0LXNlbmQtZW1haWwtcXVpY19hbXJp
YW5hbkBxdWljaW5jLmNvbS8KPgo+IEFtcml0IEFuYW5kICgyKToKPiAgIGR0LWJpbmRpbmdzOiBh
cm06IHFjb206IFVwZGF0ZSBEZXZpY2V0cmVlIGlkZW50aWZpZXJzCj4gICBkdC1iaW5kaW5nczog
cWNvbTogVXBkYXRlIERUIGJpbmRpbmdzIGZvciBtdWx0aXBsZSBEVAo+Cj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwgOTAgKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2FybS9xY29tLGlkcy5oICAgICAgICAg
ICAgICB8IDg2ICsrKysrKysrKysrKysrKysrKysrLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTY3
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNy40Cj4KPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
