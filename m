Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C5AC88E5C
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 18:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgHC9+MFr5IXHjYO1YcyQ7AGfm7SRFmz9T9E8l9dsZI=; b=sEoQIuqtetKB00
	EsQiB4V4T/hBGkI6eboK2L5foKdUR4B3SizxqSjH7H08w7ZH/Xp4uabKRVlUPbuOKGORYF7WJ4IKv
	OMBXqeHOROqsoPeTuBrhhqgViWSk6s3jtnRJM3AH3nBPMN61SJyy5DhrVN1rwAVVlMhPNl97NAYRS
	ZSQkOsYWUOAr85T8JD/JlytMbaABdPIDHrpQVpHBQNFruHsoVoLWjem7Oq3K7/bnom61zPVOdUZaL
	hfqbGRO2y8T8+rAFbORMhAZQQgZcycnv8j8rYuHbXxQ9UYJqpov1wqM1haCUxBuOXTdmyMW6/aVpv
	do4p8+nRxonGZTIpL+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ot9-00000001uNS-3YHO;
	Sun, 13 Sep 2026 18:25:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ot7-00000001uMl-165M
	for linux-riscv@lists.infradead.org;
	Sun, 13 Sep 2026 18:25:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2beW2450902
	for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 18:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkLKYhzdmWx8ASPEw+bfyEGrvJszZcX0ihy3/m9xYe4=; b=KJB0+VLID+cSRmJc
	EIWHRn+VH954/zglrkOFq0tU03iOMtCk3ZmbQ1nHHCR7xGASsfHWNfQzFHb6SL8F
	hB3ePZ9kXc70wJrEGbmCVFCaTZxBtAWG9i+7hs/u4fTdvL7KmApI8X6QgmazBr21
	XFrx8wSTeIMym88Phf2iEdH/oPL/dSa/JBqgjxS3IyII/CBoFp5JGZ74Et9K3lgw
	rorHUMAZYOvgZ1fSFTdMKjSjX4cn0XaH9S/qLAaEMuW9JF3ufYY3whAgKr9Im115
	er5/s5kUXytHDQdXAOqKKibQnyFR2fLZGvu6YZmoPcODjCylab61rPc68nsMLyFJ
	8FSXRg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d3v8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 18:25:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso2492338a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789323911; x=1789928711; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GkLKYhzdmWx8ASPEw+bfyEGrvJszZcX0ihy3/m9xYe4=;
        b=Q57eqZaDbkegmuZvDFXt33OiS8KWyv4hQaB9ves3l+iu7rh+W5EubAcRy6aoOZcbJa
         vh85Ig3rGuFnRM4dljoyVcBRbpjjKg++zqjsdiKwX4fy82NLkWR3+vAb4ivfhzRbLmnF
         KcQLJTH4++9g+EaONftE4dQJd//nRSRHs4le74Y0KwSqNaYJ48P2WbBVEp1bx3QNgOCF
         eFHQPZG5R9V4H40XAMcN7EmOQWlXTQ2nm5kFxzyVDoxPJhAnYL+oVvMwtLuPSVm+pSfV
         wDPsOtdNTPUPuWZeMFA6TPGtMKMLdti1pWiSPr5ZqVCnzlLFS31vo/nOurnkbwicp4gy
         6zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789323911; x=1789928711;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkLKYhzdmWx8ASPEw+bfyEGrvJszZcX0ihy3/m9xYe4=;
        b=FMviNjGHw3vQ41QOHP9BvsPXyR1ljCaRLZK9J7jbbHUG0etM6/QqCcyxDM3uFGEG4J
         DoDgByvE3dRQdqt0C1hsZl+2t8bbBzQWkCrlSZs4lMNOPiZt+feGjBwAvymu3T7aQIzN
         BgQosRAIGJG1vdEjE9VDXOxeOhbL3ja5oEyCKRKOqn/wJlKf5/BOMCVvPOUKz3oRRwin
         CeJytwMVLbWQUekoOmCeWaAJo0K+wtu7Xe8cxxDMc3rSuW5RGRMjO5oD52KK2H8LSEaF
         Ms8Yjth6PmqNd5r8CSVdGKweakarr/s2RPuc41dz49szdH3tYVRcsOzqLuvA9pqidR4k
         1ulw==
X-Forwarded-Encrypted: i=1; AKwUvBzxq5e+KeJfQIMJ337hewB71mOrIg0XeqNjXubpnOVY/xM1F+24waf8VyjC6Lb1Rqi2yREMWt6IvAdETg==@lists.infradead.org
X-Gm-Message-State: AFuF++kOVCrz6uOYMgBaiOOLa9zFHqLavDAp0uuUrqfgwlyB2MtzJNZY
	MM0EZbsQFrnQFTbw2k2LFNmrcu41c4+9Uml/wzJkybmCwCptctOGuPVDF3ee9VUyf5Y+9ehzqsj
	oQfkNpNcxzDRcnoh8LJxALJn3SBnN8AzZRmln9VEzZXT1sa2w0Z3S3GSKrCQ/2JVceDxAA4U=
X-Gm-Gg: AYBFou3byzvCK31HuEeVbgdMzNZaSfiEE2AK7YgbeR5xAfwn1vCk+u9BdxgMy+2Fw9q
	GgNyeVrCnb/KFWJK3sTvp6DOT1OgZ6GzbWoy7Hfl5/0mijXM0eVfxrxzYtByskSsLtI7xkwHehU
	CvWOaq+EvfzZLSpEgsAVJ3NsM7lorZ+PrbC8wmruoTBuCdwMBLQSh2kaCU/dJYLeTTKAQkidMy7
	km7c9d1kI94BeutePs1evQh25Kp1QJT9jC5NbrnCXFVzNHgXYDSl02IGt8PxeWo1eDjGNynVmeT
	WM58az6C1f4s6wJx1ZXgZ3pvcpHA3gF6XTnxfBDa8UlUA3Z3D3etx7XukwnjQ0dT1cJkZlVKQpX
	Q0nk=
X-Received: by 2002:a05:6a21:6016:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3db0e0ea40amr13919545637.8.1789323910650;
        Sun, 13 Sep 2026 11:25:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6016:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3db0e0ea40amr13919502637.8.1789323910173;
        Sun, 13 Sep 2026 11:25:10 -0700 (PDT)
Received: from localhost ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm23050289eec.3.2026.09.13.11.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 11:25:09 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 14 Sep 2026 02:24:58 +0800
Message-Id: <DLEEDV17BW1I.2QLKNNOLNOTGS@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <spacemit@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 00/17] drm/spacemit: add SpacemiT K3 display support
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <codykang.hk@gmail.com>, "David Airlie" <airlied@gmail.com>,
        "Simona
 Vetter" <simona@ffwll.ch>,
        "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard" <mripard@kernel.org>,
        "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Rob Herring" <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor Dooley"
 <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>,
        "Vinod Koul"
 <vkoul@kernel.org>,
        "Neil Armstrong" <neil.armstrong@linaro.org>,
        "Haylen
 Chu" <heylenay@4d2.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        "Yao Zi" <me@ziyao.cc>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        "Guodong
 Xu" <docular.xu@gmail.com>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
In-Reply-To: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI1OSBTYWx0ZWRfX93GlP+ZYKs28
 bbGaTno7aQ7nXnt6RSuj6y0YczwjuwLKoESRfzcDUt9U0tW7g3YBw9pcsZfx9y6hLByuxZLRFRr
 6FwDr9kVKPGb4GG9v5Ow40/6RB0QLHM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI1OSBTYWx0ZWRfXxg362FyPcuOl
 jZgCrEmTOdEk2E3008Hdjqx4zIvvDKQ+Xmxj6fd2gRQ0q9rdu1RpsWO0K2O5oC67UWOiVYc2Dyr
 QZf74sUr0cc7+zgQBaPX7fmPInUmzQvrsVSaldJLnXD2PB2OQDxF/Wh0Lme5T/+WLt0svr9J9P/
 +GGEM7KeohWYFX8s2sC/O5kSi7SwE1SgmAlHFb8snAI5SiY0Q7YtblXsj9bBaroB7CrTPwYPFaN
 prW00XjZtQqQfmZvNQsqHKcPoYSfcObcVj2lC7CBlE6lp/imQ9MVEIz4gqrAmUae17waIG+77Bg
 GBNCbhjufL1MYDrbA7oq41ldQqYW3TRel0T/3sEWig52PgXykrhj5sKrgFiDo97ISCU4H3xKW/H
 Q70EwVmtytM7dcOdpg8hompguUWwOiyDv5fCtARYcKkssi7jrrknD5OLb9YR9mAASE9N7OKRZtt
 HpXiMzQCr1fwMnpldmA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa6ea87 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rqWh80hda8-QOrsfWKMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: VMZackLmicPBwM_5VLQqxQHWtQXXwdIf
X-Proofpoint-GUID: VMZackLmicPBwM_5VLQqxQHWtQXXwdIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_112513_311189_1A02C689 
X-CRM114-Status: GOOD (  30.49  )
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

On Sun Aug 9, 2026 at 9:14 PM CST, Cody Kang via B4 Relay wrote:
> This series adds display support for the SpacemiT K3 [2], a RISC-V SoC:
> a new DRM driver, a new PHY driver and three new bindings.
>
> The display path is three blocks deep:
>
>   Saturn DPU -> Innosilicon DP/eDP controller -> Innosilicon DP PHY
>
> In v2, two major improvements:
>
> - Module unload is now robust.
> - The bindings now require the controller's output port (port@1).
>
> The rest of the v2 changes please see below, with details in each patch's
> changelog.
>
> Sashiko AI review contributed total review comments: 57 items, which I
> accepted: 14 items.
>
> v2 repeated the full v1 test matrix on both boards, in built-in and
> modular configurations, plus the new module load/unload rounds.
>
> The v1 cover letter follows below, unchanged, to provide some backgroud
> (I can remove them from cover letter in next version):
>
> The Saturn DPU is SpacemiT's own display processing unit. It has a private
> address translation unit and a command-list composer that replays a batch
> of register writes when a flush is latched. It exposes one CRTC with one
> primary plane. The K3 instantiates two DPUs, one per display path.
>
> The DPU driver arrives as five staged patches to keep each one a
> reasonable size. The driver only becomes buildable with that last patch.
> Bisect safe.
>
> The DP/eDP controller and its PHY are Innosilicon IP, also two instances
> of each. An instance behaves as embedded DisplayPort or as external
> DisplayPort purely according to what its output port is wired to, so the
> bindings do not distinguish them. The PHY's registers are interleaved
> with the controller's inside one MMIO window, which is why it is
> described as a child node and shares the controller's regmap.
>
> The pixel clock is generated by the DP PHY's PLL, and the SoC's APMU
> pixel-clock mux takes that PLL as an input. Rather than let the display
> driver reach into PHY registers, the PHY registers its PLL as a clock
> provider and the APMU mux is parented to it through the clock framework.
> That is what patches 2, 4, 5 and 6 are for, and it is also what keeps the
> APMU and the DP/eDP controller out of a devicetree provider cycle.
>
> As a first posting of the K3 display subsystem, this patchset supports:
> a single primary plane per CRTC, linear RGB scanout (no plane scaling,
> rotation, YUV or writeback). It does not support DSI, DSC or DP audio,
> and link rates are capped at HBR2.
>
> Based on drm-misc-next at commit 5b9af25f2d0b ("accel/ivpu: Remove
> unnecessary min_t()/max_t() usage"), v7.2-rc2 based.
>
> Testing this series needs a SpacemiT u-boot carrying display support
> [1]. SpacemiT expects to add that support into an official u-boot
> release in August 2026.
>
> Tested on two K3 boards:
>
>   - Pico-ITX: an eDP panel and an external DisplayPort monitor.
>   - CoM260-IFX: DisplayPort only, no eDP.
>
> Note: The eDP panel DTS enablement is not part of this series; a separate
>       series will follow showing how eDP can be verified.
>
> What was run on both boards, with modetest from libdrm and with kmscube:
>
>   - modetest -s, looped over 1920x1080, 1280x720 and 3840x2160
>     on DisplayPort and 2560x1600 on eDP
>   - kmscube, on each head and on both at once
>   - hot-plug and sink swap on the DisplayPort connector

Hi Cody,

Tested the series on a K3 Pico-ITX (mainline v7.3-rc2 + these patches,
display drivers built in). On the DisplayPort output:

- modetest -s: 1920x1080 and 1280x720 OK (native 2560x1440 as well);
3840x2160 not tested: my monitor has no such mode.
- kmscube: OK.
- hot-plug: unplug/replug detected, output re-enables fine.

Tested with the stock vendor U-Boot (2022.10); DP works fine with it.

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
