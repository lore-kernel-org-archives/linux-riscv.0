Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19599C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 04:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCnQPRWEWlduV/ijPvjFeQjzvNdBDl9Z235hRKGVKKI=; b=MYlx7qZqRNydVX
	kyNbMUun1IwuR7TYxhKFPMnh7rhQMw8ZIa+8zc/5yMCZwPeY5oOwO8XogRzBGe/nWIEkQohuQifMO
	sRb1ePhI/iwmjKP5SqqKIB6gg94LWISxrySHoYbIj2kOpoc9M8E58O8KhDD1jLjyiv09CjPzhndND
	mStQJBOFqQy3/ChsZyuEHoHE6c7GcSmcFEmKOx4SI2Zuqp4oRI5vEnNM0pvyx9+0LpqS7KiXv9DiC
	bXcRSn7E5+OBH6ZRRO9Zarnu8I51LUGaG4I+l4mA1Vx9fryC+DAlMvepg4krbgy47JX76Y0kc+9Rh
	cL9qvE/wKg1qYTdh0xRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOrnl-00000008z2v-3GKB;
	Wed, 03 Jul 2024 04:41:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOrni-00000008z0j-0ZiC;
	Wed, 03 Jul 2024 04:41:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B36ECE28B0;
	Wed,  3 Jul 2024 04:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937ECC32781;
	Wed,  3 Jul 2024 04:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719981658;
	bh=b86s8S/BWvsC8b0Mn14aMXJORMOj66Dtkv35CE2w6/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IdQs7PgcbxsPwEncmdYaFJmEXnmYSVcHoJr79LohJ1CYXuI/JRvZMhO1hcr18Q+3o
	 6/nxa2D8sj3fytR16Fq+gNRwD+T6TlovWNZvbslMHfBeJeHGeoERJImjNBrdBhZaGY
	 EkmM6PtmSK1f894i4a68Td4K13OpcHsT8xQGnljlKzfAxpV64EKxrr48t7LH4UXVFS
	 2F2x+BoUXDyko4wCeNYLtGp/FeebprTLgySeglF27lgP4oedQF42+T63P5dgtSABZL
	 Bo6OhpmHgeqpe1OTT/mGGbyzyEPbMstxECbphZixRogIgh85OBkrJfqcU4vMBXv59q
	 g51bSRCCZzisQ==
Message-ID: <8593db2e-8a69-418f-b00e-8fafe434dd30@kernel.org>
Date: Wed, 3 Jul 2024 06:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/47] arm64: dts: qcom: qcs9100: Introduce QCS9100 SoC
 dtsi
To: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, djakov@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, jassisinghbrar@gmail.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, manivannan.sadhasivam@linaro.org, will@kernel.org,
 joro@8bytes.org, conor@kernel.org, tglx@linutronix.de, amitk@kernel.org,
 thara.gopinath@gmail.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, rafael@kernel.org, viresh.kumar@linaro.org,
 vkoul@kernel.org, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com
Cc: robimarko@gmail.com, quic_gurus@quicinc.com,
 bartosz.golaszewski@linaro.org, kishon@kernel.org, quic_wcheng@quicinc.com,
 alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
 agross@kernel.org, gregkh@linuxfoundation.org, quic_tdas@quicinc.com,
 robin.murphy@arm.com, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, quic_rjendra@quicinc.com, ulf.hansson@linaro.org,
 quic_sibis@quicinc.com, otto.pflueger@abscue.de, quic_rohiagar@quicinc.com,
 luca@z3ntu.xyz, neil.armstrong@linaro.org, abel.vesa@linaro.org,
 bhupesh.sharma@linaro.org, alexandre.torgue@foss.st.com,
 peppe.cavallaro@st.com, joabreu@synopsys.com, netdev@vger.kernel.org,
 lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 ahalaney@redhat.com, krzysztof.kozlowski@linaro.org,
 u.kleine-koenig@pengutronix.de, dmitry.baryshkov@linaro.org,
 quic_cang@quicinc.com, danila@jiaxyga.com, quic_nitirawa@quicinc.com,
 mantas@8devices.com, athierry@redhat.com, quic_kbajaj@quicinc.com,
 quic_bjorande@quicinc.com, quic_msarkar@quicinc.com,
 quic_devipriy@quicinc.com, quic_tsoni@quicinc.com,
 quic_rgottimu@quicinc.com, quic_shashim@quicinc.com,
 quic_kaushalk@quicinc.com, quic_tingweiz@quicinc.com,
 quic_aiquny@quicinc.com, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@quicinc.com
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703025850.2172008-3-quic_tengfan@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240703025850.2172008-3-quic_tengfan@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_214102_543679_197ADEBF 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 03/07/2024 04:58, Tengfei Fan wrote:
> Introduce QCS9100 SoC dtsi, QCS9100 is mainly used in IoT products.
> QCS9100 is drived from SA8775p.
> The current QCS9100 SoC dtsi is directly renamed from the SA8775p SoC
> dtsi.
> The QCS9100 platform is currently in the early design stage. Currently,
> Both the QCS9100 platform and SA8775p platform use non-SCMI resources,
> In the future, the SA8775p platform will transition to using SCMI
> resources and it will have new sa8775p-related device tree.
> This QCS9100 SoC dtsi remains consistent with the current SA8775p SoC
> dtsi, except for updating the following sa8775p-related compatible names
> to the qcs9100-related compatible name:
>   - qcom,sa8775p-clk-virt
>   - qcom,sa8775p-mc-virt
>   - qcom,sa8775p-adsp-pas
>   - qcom,sa8775p-cdsp-pas
>   - qcom,sa8775p-cdsp1-pas
>   - qcom,sa8775p-gpdsp0-pas
>   - qcom,sa8775p-gpdsp1-pas
>   - qcom,sa8775p-gcc
>   - qcom,sa8775p-ipcc
>   - qcom,sa8775p-config-noc
>   - qcom,sa8775p-system-noc
>   - qcom,sa8775p-aggre1-noc
>   - qcom,sa8775p-aggre2-noc
>   - qcom,sa8775p-pcie-anoc
>   - qcom,sa8775p-gpdsp-anoc
>   - qcom,sa8775p-mmss-noc
>   - qcom,sa8775p-trng
>   - qcom,sa8775p-ufshc
>   - qcom,sa8775p-qmp-ufs-phy
>   - qcom,sa8775p-qce
>   - qcom,sa8775p-lpass-ag-noc
>   - qcom,sa8775p-usb-hs-phy
>   - qcom,sa8775p-dc-noc
>   - qcom,sa8775p-gem-noc
>   - qcom,sa8775p-dwc3
>   - qcom,sa8775p-qmp-usb3-uni-phy
>   - qcom,sa8775p-gpucc
>   - qcom,sa8775p-smmu-500
>   - qcom,sa8775p-dwmac-sgmii-phy
>   - qcom,sa8775p-llcc-bwmon
>   - qcom,sa8775p-cpu-bwmon
>   - qcom,sa8775p-llcc
>   - qcom,sa8775p-videocc
>   - qcom,sa8775p-camcc
>   - qcom,sa8775p-dispcc0
>   - qcom,sa8775p-pdc
>   - qcom,sa8775p-aoss-qmp
>   - qcom,sa8775p-tlmm
>   - qcom,sa8775p-imem
>   - qcom,sa8775p-smmu-500
>   - qcom,sa8775p-rpmh-clk
>   - qcom,sa8775p-rpmhpd
>   - qcom,sa8775p-cpufreq-epss
>   - qcom,sa8775p-dispcc1
>   - qcom,sa8775p-ethqos
>   - qcom,sa8775p-nspa-noc
>   - qcom,sa8775p-nspb-noc
>   - qcom,sa8775p-qmp-gen4x2-pcie-phy
>   - qcom,sa8775p-qmp-gen4x4-pcie-phy
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  .../dts/qcom/{sa8775p.dtsi => qcs9100.dtsi}   | 112 +++++++++---------
>  1 file changed, 56 insertions(+), 56 deletions(-)
>  rename arch/arm64/boot/dts/qcom/{sa8775p.dtsi => qcs9100.dtsi} (97%)
> 

How do any things compile at this point? Please squash the patches. Your
patchset must be bisectable at build level (dtschema validation does not
have to).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
