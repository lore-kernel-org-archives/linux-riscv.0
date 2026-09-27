Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493B7C9830E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOBEEdpWsRQXD3HszMvCyZLl48N/uQ9u9YzIs3vYG5g=; b=WSKs+y0PvNa5J6
	8KowUhSMJvjxAd02eD/MRKuYEN/mmTIp4vTbQnf91zJCQ2v4hkh5vvOAMDADfiUwe/VrbJDn44SCR
	lZ6QuJev3pI0475O82/DQMSEvUu5XUxyMu2xM3udQDEsuZ/dqvX9Ln8xSAO5KX37865X88W6WUWPo
	pBDQeQqE1/SPZhp43fhu2WBtkBz3Dwpee5T5xaXuWa/IDGDzXu6IGP/WsZAimCy8JOv2uJhedLq4/
	O7tgtnXmrrFCmFTNjEe2BeiMfeGE4/mjcOr+Dr+zO6nKm3bA43MKFbHf1y/Pk9iD/HMSjk5v+DbNw
	vyGYfXj1JTE0kHt+UUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArkq-0000000GZGt-3WXL;
	Sun, 27 Sep 2026 16:29:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArkW-0000000GYwa-351Y;
	Sun, 27 Sep 2026 16:29:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7920F43FD3;
	Sun, 27 Sep 2026 16:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0663A1F000FF;
	Sun, 27 Sep 2026 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790526552;
	bh=MlHTKFJ9nOjJ4sei8TYyoCL9woju/FNAQOM8EKr+6Eo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IxICCo1rUsPvmAF8mGGbFkPTJ05RBCUvmgy0UW4EUH76muN5ijdWchfDgdrhVUnJI
	 DqizfgfFeCpZ3NJm4x5u3yT0j9l14+gPWqRSeC2jaHAUC2KyzsaTn6XWRVNtZQd3TI
	 jiq839Ujj9K7/+0qMDQDFXIL28VrHq1M+QIS06NTqW1b6jQI7cpplV1F15dgONJcTv
	 DYjcDiDgcgL1CiF1fjfr+bjgrO5X+f+AhMN8MYHdKoNZHrriryVFVHnNsI5AliU08+
	 l95TAGiQbIcFCjwFMxd1qNLhC5LcrvjItGrB+3gsQtloH4zHcN9iJ2LeItn7yiTplv
	 fwKE+ITzIHRdA==
Subject: Re: [PATCH net-next v15 4/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
From: netdev-bot+sashiko@kernel.org
To: bartosz.golaszewski@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vkoul@kernel.org,
 peppe.cavallaro@st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 shawnguo@kernel.org, festevam@gmail.com, jan.petrous@oss.nxp.com, s32@nxp.com,
 mohd.anwar@oss.qualcomm.com, romain.gantois@bootlin.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, mripard@kernel.org,
 christophe.roullier@foss.st.com, brgl@kernel.org, radu@rendec.net,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dfustini@tenstorrent.com,
 linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 bartosz.golaszewski@linaro.org
Date: Sun, 27 Sep 2026 16:29:09 +0000
Message-ID: <179052654960.2160803.15091686199225539012@kernel.org>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-4-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-4-e82f33720737@oss.qualcomm.com>
X-sashiko-severity: Medium
MIME-Version: 1.0
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUocykgdG8gY29uc2lkZXIuCgpDcml0aWNhbDogMCDCtyBIaWdoOiAw
IMK3IE1lZGl1bTogMSDCtyBMb3c6IDAKCklmIHlvdSBiZWxpZXZlIG5vbmUgb2YgdGhlIGlzc3Vl
cyBhcmUgbGVnaXRpbWF0ZSwgcGxlYXNlIHJlcGx5IHRvIGVhY2gKaXNzdWUgb2YgTWVkaXVtIHNl
dmVyaXR5IG9yIGhpZ2hlciBhbmQgZXhwbGFpbiB3aHkgdGhlIEFJIGlzIHdyb25nLgpJZiBhbnkg
b2YgdGhlbSBhcmUgbGVnaXRpbWF0ZSBhbmQgeW91IHBsYW4gdG8gcmVzcGluLCBwbGVhc2UgbGV0
IHBhdGNod29yawprbm93IGJ5IGluY2x1ZGluZyAicHctYm90OiBjciIgYXMgYSBzZXBhcmF0ZSBs
aW5lIGF0IHRoZSBlbmQgb2YgeW91ciByZXBseQoob25lIHN1Y2ggcmVwbHkgcGVyIHNlcmllcyBp
cyBlbm91Z2gpLgoKLSBbTWVkaXVtXSBUaGlzIHBhdGNoIHJhaXNlcyB0aGUgc2hhcmVkIGBwb3dl
ci1kb21haW5zYCBsaW1pdCBpbgogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvc25wcyxkd21hYy55YW1sIGZyb20gYG1heEl0ZW1zOuKApgoKLS0KCmR0LWJpbmRpbmdzOiBu
ZXQ6IHFjb206IGRvY3VtZW50IHRoZSBldGhxb3MgZGV2aWNlIGZvciBTQ01JLWJhc2VkIHN5c3Rl
bXMKClRoaXMgY29tbWl0IGFkZHMgYSBzZXBhcmF0ZSBiaW5kaW5nIGZvciB0aGUgZmlybXdhcmUt
bWFuYWdlZCBxY29tLHNhODI1NXAtZXRocW9zCnZhcmlhbnQgb2YgdGhlIFF1YWxjb21tIERlc2ln
bldhcmUgTUFDLiBJdCBhbHNvIGFkZHMgdGhhdCBjb21wYXRpYmxlIHRvCnNucHMsZHdtYWMueWFt
bCBhbmQgcmFpc2VzIHRoZSBzaGFyZWQgcG93ZXItZG9tYWlucyBsaW1pdCB0aGVyZSB0byB0d28u
IFRvCmtlZXAgdGhlIG9sZCBsaW1pdCBmb3Igb3RoZXIgZGV2aWNlcywgaXQgYWRkcyBwb3dlci1k
b21haW5zIG1heEl0ZW1zOiAxIHRvIHRoZQp2ZW5kb3IgYmluZGluZ3MgdGhhdCByZWZlcmVuY2Ug
c25wcyxkd21hYy55YW1sLgoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+IGluZGV4IDBmZjllMzI4NGEwNjEuLjFmMmVl
Njg0ZGMzOTEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L25ldC9zbnBzLGR3bWFjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAoKWyAuLi4gXQoKPiBAQCAtMTg2LDcgKzE4Nyw4IEBA
IHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAtIGVudW06IFthaGIsIHN0bW1hY2V0aC1vY3BdCj4g
IAo+ICAgIHBvd2VyLWRvbWFpbnM6Cj4gLSAgICBtYXhJdGVtczogMQo+ICsgICAgbWluSXRlbXM6
IDEKPiArICAgIG1heEl0ZW1zOiAyCgpbU2V2ZXJpdHk6IE1lZGl1bV0KV2FzIHVsdHJhcmlzYyxk
cDEwMDAtZ21hYy55YW1sIG1pc3NlZD8gVGhlIGNvbW1pdCBtZXNzYWdlIHNheXM6CgogIGxldCdz
IHVwZGF0ZSBleGlzdGluZyBiaW5kaW5ncyByZWZlcmVuY2luZyB0aGUgdG9wLWxldmVsCiAgc25w
cyxkd21hYy55YW1sIGFuZCBsaW1pdCB0aGVpciBtYXhJdGVtcyBmb3IgcG93ZXItZG9tYWlucyB0
byAxLgoKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC91bHRyYXJpc2MsZHAx
MDAwLWdtYWMueWFtbCBhbHJlYWR5CmV4aXN0cyBhdCB0aGUgYmFzZWxpbmUgYW5kIHJlZmVyZW5j
ZXMgdGhpcyBzY2hlbWE6CgogIGFsbE9mOgogICAgLSAkcmVmOiBzbnBzLGR3bWFjLnlhbWwjCgog
IHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKCkl0cyBwcm9wZXJ0aWVzIGJsb2NrIGxpc3Rz
IGNvbXBhdGlibGUsIHJlZywgY2xvY2tzLCBjbG9jay1uYW1lcywgaW50ZXJydXB0cywKaW50ZXJy
dXB0LW5hbWVzIGFuZCBwaHktbW9kZS4gSXQgaGFzIG5vIHBvd2VyLWRvbWFpbnMgZW50cnksIHNv
IGl0IG9ubHkgZ2V0cwp0aGUgcmVsYXhlZCBsaW1pdCBmcm9tIHNucHMsZHdtYWMueWFtbC4KCkJl
Zm9yZSB0aGlzIHBhdGNoLCBkdF9iaW5kaW5nX2NoZWNrIGFuZCBkdGJzX2NoZWNrIHJlamVjdGVk
IGEgRFAxMDAwIG5vZGUKd2l0aCBwb3dlci1kb21haW5zID0gPCZhPiwgPCZiPi4gV2l0aCB0aGlz
IHBhdGNoIHRoYXQgbm9kZSBpcyBhY2NlcHRlZC4gVGhpcwppcyBzdGlsbCB0aGUgY2FzZSBhdCB0
aGUgZW5kIG9mIHRoZSBzZXJpZXMuCgpOb2RlcyBjaGVja2VkIG9ubHkgdGhyb3VnaCB0aGUgc2Vs
ZWN0IGluIHNucHMsZHdtYWMueWFtbCBhcmUgYWZmZWN0ZWQgdG9vLgpUaGF0IGNvdmVycyBnZW5l
cmljIHNucHMsZHdtYWMqIG9yIHNucHMsZHd4Z21hYyogY29tcGF0aWJsZXMgd2l0aCBubyB2ZW5k
b3IKc2NoZW1hLiBUaGVzZSBub2RlcyBub3cgYWxzbyBhY2NlcHQgdHdvIHBvd2VyIGRvbWFpbnMs
IGJlY2F1c2Ugbm8gdmVuZG9yCnNjaGVtYSByZXN0b3JlcyB0aGUgbGltaXQgb2YgMS4KCk9uZSBv
cHRpb24gaXMgdG8gYWRkIHBvd2VyLWRvbWFpbnMgbWF4SXRlbXM6IDEgdG8gdWx0cmFyaXNjLGRw
MTAwMC1nbWFjLnlhbWwuCkFub3RoZXIgaXMgdG8ga2VlcCBtYXhJdGVtczogMSBoZXJlIGFuZCBh
bGxvdyB0d28gb25seSBmb3IKcWNvbSxzYTgyNTVwLWV0aHFvcyBpbiBhbiBhbGxPZiBpZi90aGVu
IGJsb2NrLiBUaGF0IHdvdWxkIGFsc28gY292ZXIKYmluZGluZ3MgYWRkZWQgbGF0ZXIuCgpbIC4u
LiBdCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9uZXRkZXYtYWkuYm90cy5saW51
eC5kZXYvc2FzaGlrby8jL3BhdGNoc2V0LzIwMjYwOTIzLXFjb20tc2E4MjU1cC1lbWFjLXYxNS0w
LWU4MmYzMzcyMDczNyU0MG9zcy5xdWFsY29tbS5jb20KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
