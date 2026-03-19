Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452B91091916
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 20:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkaA10RKlzXaay6tb0RXiPXinzZGkVHEPk27/QlxnQY=; b=LVCVc1OHwJZ0VH
	r9UVLQC+g4BeeoCo9EfAWplhoK5KMSS43bt25AQc+Zt6jekzt9uCjfPtDOJwdr07sWg3iKOMPChgw
	CjiMnr49XnTWyyTKzD3+ZpDqC+mUBodgLDP8WsHYv21rsEJOC9B7wmYZbdM0NW4bOK3Ak8HAOlxZl
	Ga+HWNKqXit0r8WSv7lRhgwK4Jeo2QwqMYjV13brh68VrM4KMQZs5gK+E2iM0yWfqERcvNMl2xe4i
	vD9ugd0FbxOLnBZBvXVin7JGacAZheMX3bC/ZktR4ZO0jTPjvVugc2BPo4hYi8XUWR2TWvqFUE0Kf
	CqPDWtixxpdnh7VDB32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3KNs-0000000BZ4T-3vqu;
	Thu, 19 Mar 2026 20:54:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3KNp-0000000BZ2G-2tu5
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 20:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773953660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OspvSUceR9D7FWErEaMeS4pbjFGXhTs0d3vC6fXFa4g=;
	b=VhmuvvzpL5u1BYo5ny6XYIXj0sk3QhDEufukFGj9+emBYHZei56bzWL5THsI62fKqRmoai
	xtCqspvBQgShm2UETam+u5ZBtnYJOFZFlh8C+GDpwfkCqnD9olzFDqUlZB/zxz7Vj6xlbs
	vdAdAXulFVwN5V67fqVr1/F4j8Oj1Yg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-6-dtC9KTNs-gQ_SwuxXimg-1; Thu, 19 Mar 2026 16:54:16 -0400
X-MC-Unique: 6-dtC9KTNs-gQ_SwuxXimg-1
X-Mimecast-MFC-AGG-ID: 6-dtC9KTNs-gQ_SwuxXimg_1773953656
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090bc4823cso102283291cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 13:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773953656; x=1774558456;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OspvSUceR9D7FWErEaMeS4pbjFGXhTs0d3vC6fXFa4g=;
        b=MKg0l1FDLC6nXd+Jk7BHsWSHN9cUU+Q4FHTszHCeqsTbmAoEmBh6tB3NcL8AJj9Wiq
         ZAxYFNSqDuWOMwZF7Kl4UwztRF5Zj5BjhcKXziM98mq51IBc1aOwJYbnwBMSRgfEuBTk
         AcvXdLvRZA4SaiZQeUHcqsruRnNDmq0VB84X3QD04nuKvFLwb8WlfIcFlPZodV3OvygI
         xFc9+pfaPkuizD0nprfJNrScMBLXgQCGaX30aF77Yd/qrr0X87b1inLu40P6s/+6rYUt
         kXfnj3Xwp1TriXKoRSTslYS2ynFNd6w3/LgTQQPiLQHXeLUKTVyquNbq964spvM1v4Xk
         SH8w==
X-Forwarded-Encrypted: i=1; AJvYcCXzjrJ7VGbG+27iJOpRTUkq1nlqSM8a9j9wJpCTfi66owuVwUNmBPdbzn0tKE8pptwu6PzMr2ywTfUBhw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx23WFogc7t3ptF3tVLelGK0S3s7BkqETHZlPlRtPROkS5rTd2t
	jLAEQVFyzMjFjQgGZwaGu/Ddqpuet3b4akwMVDKK9Xnw8QgZQD3v+cwIkbZcipzu/vjm2MfZ5vT
	rUUAtZtZUiViKIDqGK9nhCg5WgrNcEfKQ54p8yZCa8Iinw4Ykiop4GFz3f6kuAMHP+FWZXg==
X-Gm-Gg: ATEYQzzHDW1AyCk/kp2Ovj3XLKy3wKuxlMacLGRTenMtLho0HIpgId2JU6RaNdSIZOP
	Qz5Ks1yiyRMBbpLkSOpGSNcTixIoGR1S1eNLxfHheXRdLVGE0k646eeLEpG1woMimVCEA3R/bD7
	gmPQKMGSf57qe6MDBHwHaEagq/rr4pX8QueMAtGtjUHxic28VUd5mPCsNTEGjmfoAXruQvwG569
	quPY1WFxmvOWDnmAlPhi6Bk93x46Vu6ElVawBecTKmNDnMYk+r4t2v0apVrKPLeeECEZayfTmCn
	aHD0xOKKXkr6s5S2pBRsNjiMO9XSK0VJX76WMvfzxmEyZFmkpchkKKf/TYSzdh03ny/D/GtbO5O
	ChLQn9R2H1Lz1JIKcAiG9lfB5aOLzHVEwFn48LuBVQgXgprmbn0QXfxqSGURwyTo2eMx0q7FcUN
	jjtBoZ4PRZt7VvpQ==
X-Received: by 2002:ac8:7f54:0:b0:509:4e1e:1b9a with SMTP id d75a77b69052e-50b37586c7cmr10125671cf.54.1773953656312;
        Thu, 19 Mar 2026 13:54:16 -0700 (PDT)
X-Received: by 2002:ac8:7f54:0:b0:509:4e1e:1b9a with SMTP id d75a77b69052e-50b37586c7cmr10124851cf.54.1773953655634;
        Thu, 19 Mar 2026 13:54:15 -0700 (PDT)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e350c3sm6518601cf.19.2026.03.19.13.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:54:15 -0700 (PDT)
Message-ID: <cf908b20e5f6237c887f6d751be82670d7cbd7b7.camel@redhat.com>
Subject: Re: [PATCH net-next v9 0/6] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
From: Radu Rendec <rrendec@redhat.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn	 <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet	
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni	
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro	 <peppe.cavallaro@st.com>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec	 <jernej.skrabec@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo
 <shawnguo@kernel.org>,  Fabio Estevam <festevam@gmail.com>, Jan Petrous
 <jan.petrous@oss.nxp.com>, s32@nxp.com, Mohd Ayaan Anwar	
 <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,  Christophe
 Roullier <christophe.roullier@foss.st.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, 	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, 	linux-mips@vger.kernel.org,
 imx@lists.linux.dev, 	linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski	
 <bartosz.golaszewski@linaro.org>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski	
 <krzysztof.kozlowski@oss.qualcomm.com>, Lad Prabhakar	
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 16:54:12 -0400
In-Reply-To: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
	 <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
	 <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DHyOoPjI5ChdgjnQRlkpdPbogLVJJXC1fkVQcW3qM8k_1773953656
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_135421_792143_E82CD74D 
X-CRM114-Status: GOOD (  42.59  )
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

T24gVHVlLCAyMDI2LTAzLTE3IGF0IDE1OjEyICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOgo+IE9uIE1vbiwgTWFyIDE2LCAyMDI2IGF0IDc6MzHigK9QTSBSYWR1IFJlbmRlYyA8cnJl
bmRlY0ByZWRoYXQuY29tPiB3cm90ZToKPiA+IAo+ID4gT24gTW9uLCAyMDI2LTAzLTE2IGF0IDEz
OjA1ICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiBBZGQgc3VwcG9ydCBm
b3IgdGhlIGZpcm13YXJlLW1hbmFnZWQgdmFyaWFudCBvZiB0aGUgRGVzaWduV2FyZSBNQUMgb24K
PiA+ID4gdGhlIHNhODI1NXAgcGxhdGZvcm0uIFRoaXMgc2VyaWVzIGNvbnRhaW5zIG5ldyBEVCBi
aW5kaW5ncyBhbmQgZHJpdmVyCj4gPiA+IGNoYW5nZXMgcmVxdWlyZWQgdG8gc3VwcG9ydCB0aGUg
TUFDIGluIHRoZSBTVE1NQUMgZHJpdmVyLgo+ID4gPiAKPiA+ID4gSXQgYWxzbyByZW9yZ2FuaXpl
cyB0aGUgZXRocW9zIGNvZGUgcXVpdGUgYSBiaXQgdG8gbWFrZSB0aGUgaW50cm9kdWN0aW9uCj4g
PiA+IG9mIHBvd2VyIGRvbWFpbnMgaW50byB0aGUgZHJpdmVyIGEgYml0IGVhc2llciBvbiB0aGUg
ZXllLgo+ID4gPiAKPiA+ID4gVGhlIERUUyBjaGFuZ2VzIHdpbGwgZ28gaW4gc2VwYXJhdGVseS4K
PiA+IAo+ID4gSSdtIHNlZWluZyBzb21lIHdlaXJkIGJlaGF2aW9yIHdpdGggdGhpcyB2ZXJzaW9u
LiBUaGUgcHJvYmUgcGFydCBsb29rcwo+ID4gZ29vZCAoYnV0IHNlZSBiZWxvdyksIGJ1dCB3aGVu
IEkgdHJ5IHRvIGJyaW5nIGFuIGludGVyZmFjZSB1cCwgaXQgZmFpbHMKPiA+IHdpdGggRVRJTUVE
T1VULiBUaGUgcmVsZXZhbnQgcGFydCBvZiB0aGUgc3RhY2sgdHJhY2UgbGVhZGluZyB0byB0aGUK
PiA+IGVycm9yIGlzIHRoaXM6Cj4gPiAKPiA+IGR3bWFjNF9kbWFfcmVzZXQrMHgyMDgvMHgyMjAg
W3N0bW1hY10KPiA+IHN0bW1hY19yZXNldCsweDJjLzB4NjggW3N0bW1hY10KPiA+IHN0bW1hY19p
bml0X2RtYV9lbmdpbmUrMHgxMDgvMHg0MDAgW3N0bW1hY10KPiA+IHN0bW1hY19od19zZXR1cCsw
eDVjLzB4NTM4IFtzdG1tYWNdCj4gPiBfX3N0bW1hY19vcGVuKzB4YzgvMHgyYTAgW3N0bW1hY10K
PiA+IHN0bW1hY19vcGVuKzB4Y2MvMHgyMzggW3N0bW1hY10KPiA+IF9fZGV2X29wZW4rMHgxMzgv
MHgyYTgKPiA+IAo+ID4gTm93IGR3bWFjNF9kbWFfcmVzZXQoKSBpcyB2ZXJ5IHNpbXBsZS4gSXQg
c2V0cyB0aGUgc29mdCByZXNldCBiaXQgaW4KPiA+IHRoZSBETUFfQlVTX01PREUgcmVnaXN0ZXIs
IHRoZW4gd2FpdHMgZm9yIHRoZSBoYXJkd2FyZSB0byBjbGVhciBpdCwgYW5kCj4gPiB0aGF0IG5l
dmVyIGhhcHBlbnMuCj4gPiAKPiA+IE5vdywgZ2V0dGluZyBiYWNrIHRvIHRoZSBwcm9iZSBwYXJ0
LCB0aGVyZSBpcyBvbmUgZXh0cmEgbWVzc2FnZQo+ID4gKGNvbXBhcmVkIHRvIG15IHByZXZpb3Vz
IHN1Y2Nlc3NmdWwgdGVzdCBvbiB2NyksIHdoaWNoIEkgc2VlIGF0IHRoZQo+ID4gdmVyeSBlbmQg
b2YgdGhlIHByb2Jpbmc6Cj4gPiAKPiA+IMKgIHFjb20tZXRocW9zIDIzMDQwMDAwLmV0aGVybmV0
OiBjbGtfY3NyIHZhbHVlIG91dCBvZiByYW5nZSAoMHhmZmZmZmYwMAo+ID4gwqAgZXhjZWVkcyBt
YXNrIDB4MDAwMDBmMDApLCB0cnVuY2F0aW5nCj4gPiAKPiA+IFRoaXMgaXMgYSBzYTg3NzVwIHJp
ZGUgYm9hcmQsIHNvIHRoZXJlIGFyZSB0d28gc3RtbWFjIGRldmljZXMuIEkgb25seQo+ID4gc2Vl
IHRoYXQgbWVzc2FnZSBmb3IgdGhlIDJuZCBvbmUsIHdoaWNoIGlzIGFsc28gdGhlIG9uZSBJJ20g
dHJ5aW5nIHRvCj4gPiBlbmFibGUsIGFuZCB3aGljaCBmYWlscy4KPiA+IAo+ID4gSSByZWFsaXpl
IHRoaXMgbWF5IG9yIG1heSBub3QgYmUgcmVsYXRlZCB0byB5b3VyIGNoYW5nZXMuIEJ1dCB0aGVy
ZSBpcwo+ID4gbm8gd2F5IHRvIHRlc3Qgb24gYSBTQ01JLXBkIGJvYXJkIHdpdGhvdXQgdGhlbS4g
SSdtIG5vdCBzdXJlIGhvdwo+ID4gcmVsZXZhbnQgaXQgd291bGQgYmUgdG8gdGVzdCBvbiB0aGUg
bm9uLVNDTUkgdmFyaWFudC4gSSdtIGFzc3VtaW5nIHRoZQo+ID4gRE1BIHBhcnQgc2hvdWxkIHdv
cmsgdGhlIHNhbWUgd2F5IChyZWdhcmRsZXNzIG9mIFNDTUktcGQpLCBzbyBpZiBJIGNhbgo+ID4g
cmVwcm9kdWNlIGl0IHRoZXJlLCBhbmQgc2luY2UgSSBrbm93IGl0IHdvcmtzIG9uIG1haW5saW5l
IExpbnV4ICh0aGF0J3MKPiA+IHdoZXJlIEkgdGVzdGVkIHY3KSwgSSBjb3VsZCBiaXNlY3QgYW5k
IHNlZSB3aGljaCBjb21taXQgaW4gbmV0LW5leHQKPiA+IGJyZWFrcyBpdC4gSWYgeW91IGRvbid0
IGhhdmUgYW55IGJldHRlciBpZGVhLCBsZXQgbWUga25vdyBhbmQgSSBjYW4KPiA+IHRyeS4gTWVh
bndoaWxlLCBJJ2xsIGtlZXAgcG9raW5nIGF0IHY5Lgo+ID4gCj4gCj4gRG9lcyBjdXJyZW50IG5l
dC1uZXh0IG9uIGl0cyBvd24gc3RpbGwgd29yaz8gT3IgaXMgdGhlIHNlY29uZAo+IGludGVyZmFj
ZSBicm9rZW4gZXZlbiB3aXRob3V0IHRoaXMgc2VyaWVzPwoKSSBkb24ndCB0aGluayB0aGVyZSBp
cyBhIHdheSB0byB0ZXN0IG5ldC1uZXh0IG9uIGl0cyBvd24gKHdpdGhvdXQgeW91cgpzZXJpZXMp
IG9uIGEgYm9hcmQgd2l0aCBTQ01JLXBkIGZpcm13YXJlLiBJdCB3b3VsZCByZXF1aXJlIHRoZQpx
Y29tLWV0aHFvcyBkcml2ZXIgdG8gaGF2ZSBkaXJlY3QgYWNjZXNzIHRvIHRoZSBjbG9ja3MsIGJ1
dCB0aGUgY2xvY2tzCndvdWxkIG5vdCBiZSB0aGVyZS4KCldoYXQgSSBjb3VsZCB0ZXN0IHRob3Vn
aCBpcyBhIGJvYXJkIHdpdGggdGhlICJvdGhlciIgZmlybXdhcmUgKHdpdGhvdXQKU0NNSS1wZCku
IEFuZCBvbiB0aGF0IGJvYXJkLCBJIGRvICpub3QqIHNlZSB0aGUgcHJvYmxlbSBldmVuIHdpdGgg
eW91cgpzZXJpZXMgYXBwbGllZC4gSW4gZmFjdCwgSSB0ZXN0ZWQgdGhlIGV4YWN0IHNhbWUga2Vy
bmVsIGJ1aWxkIEkgaGFkCnByZXZpb3VzbHkgdGVzdGVkIG9uIHRoZSBTQ01JLXBkIGJvYXJkLgoK
SSdtIG5vdCBzdXJlIHdoYXQgdG8gbWFrZSBvZiB0aGF0IG9yIHdoYXQgZWxzZSBJIGNvdWxkIHRy
eS4KCkZXSVcsIHRoZSAiY2xrX2NzciB2YWx1ZSBvdXQgb2YgcmFuZ2UiIG1lc3NhZ2UgSSBtZW50
aW9uZWQgYmVmb3JlIGlzCnN0aWxsIHRoZXJlIG9uIHRoZSBib2FyZCB3aGVyZSBldmVyeXRoaW5n
IHdvcmtzLCBzbyBpdCdzIHByb2JhYmx5IGEKcmVkIGhlcnJpbmcuCgotLSAKUmFkdQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
