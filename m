Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB945CD37B5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 10:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJudCuN6ma8ZFysjxZWdglDfY3yHketjhAuomng8oxo=; b=a43CZ3tx14doeY
	64tfFnapqQSRRWJxqNHc8z7Cv6xXqbob8sgDoh2KZEOmXQ8q/21nptFY67vhLJGiAxG7XVLe5G2t8
	ZKQsiuQGKg+qF2bAyfbJJ04yaWc/UcG7hyj078kHPux3Io0VTRi8oNa7erU4LMGqKpKqVlHYcBIZi
	kIpJGtyN9TN4tXOZHyYgywvy8LfYB2MF/iDpctJew7d/IO4lWlqYyJZiTv0rHfpkhc4BGU3ZqJF7C
	9mLZFBs5iOAiGY6ltFMYRTs99++H1GmLFp4WX7BSMHxL16S8Q04OxXf1TnqDPjNlxyDLFSC3/0Ig2
	uzBs2an4gDiBCJBpRDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOHD-0000000DC4g-1lKC;
	Mon, 11 May 2026 10:54:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOHA-0000000DC3d-2BVE
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 10:54:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B71Ajr2500655
	for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 10:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxocFjuN0LOAjgweyXXNhrSSGQgx5Dl/pI1l7dwYsLM=; b=Y8QJ4sdYNG0tl2UK
	FU5oRfpx5ApMhP51wQBqVYIbKTTM092/F3DjkkOuL2oHZIBJQZOurdFmp3QH/bFq
	MeiCPDLJm6SFj11z83N3FLu6bAtw+S7dT9IRRUvNd4ykev7mi2jZWCnq+WDBvPxa
	mFwYC62zKehdxRWWao/gN9Dj717eZ5yIl5iBk4Yz634tsXY3PYIGO4TLCC2s2XJk
	Id51kKYCKXPk2HSwRIWOcXC+6JRUCRWXPyMmGbzYuwLiLO716635fpa/RAKDfSOs
	RuwZmSlNpr2m+GDXRE05L37UMX0aY7l2b9TPy4HIaNG3xiK4F11o731NjZ7JQXHp
	uU8eFw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79njgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 10:54:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63146b7289bso3914226137.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778496855; x=1779101655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxocFjuN0LOAjgweyXXNhrSSGQgx5Dl/pI1l7dwYsLM=;
        b=L4vY1Sj29xLxWo3ZoqJmCdwwQX21UgdbZPaoP1/Tmvf6NIli1mhXCtCP23QMRSawb+
         ekvHRh5uP74tgbJj5g2OOy3S7XH13g4moNnCesBZn15wsAn1rf41S6U5jY8ZiNrJM1Ka
         eMDw+SW7xfisqCqqC28Dvr7T6TtlZCI9ebaokZvwLAQouPIun4C7B5AHhp3HB9y9qXHw
         mNkFgaQ8N1mVYlv4swErz5rneSZb6I3ToFmw7ZV8WLVp1j27DEaWsNlKEjufVSBiMTCL
         nbcwO65N/umhfdguNtBpwEATOb3B2IwFwvH5/5nrTGWJZ34tOMiqE/Htrt6iI8ivJkYg
         pl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496855; x=1779101655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TxocFjuN0LOAjgweyXXNhrSSGQgx5Dl/pI1l7dwYsLM=;
        b=pkRZgrg2QeohZ/erTI8NtWNPA71D14dR9EEpsLNqTgdOXF97yVXmMuNvBM7sujp9pL
         a5L8eU7dhHSrokgdpQKV9S+78qm3hNQm9uRI79kKG9nDDeRwiH4cJzGDWWXZ4JzrwnX2
         Pz/dHc0FNWbIlyqaQFJ5+qCA7zd9CoE//+hexf7eh7odo56IR2y0OeG2D710g6nrUeSv
         dpIWtNa11B566s7VJGoKnnPaHvX24JGXfV+65lkSM/wGDKpnwyyNVPH+EtPJpxycXJNj
         7bTfeeRPuEp42Zs8Ij51mz0sP9pfreYdo7m3zJvHnYvoAcovr7lXX3BMCiOjZS/T+qEZ
         Xzww==
X-Forwarded-Encrypted: i=1; AFNElJ8F97potfTUtV6WCDzkqcXRmIOQqvWL+/1vNuxpffgssf8VZilvC1TMmQtz9msNc2JH4HvP+mQxrDpMNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaMyX+4HHGGHx0bZQxdJzte8di5lEsFhkMC3hzXBG7sJ916F2R
	Xx91tGV5DGGjNYMMRTJQ7RtgS/JuUydHQZ1ui71ic8+WcEV9LubwvpYgMDnD0bFIthkhxq0Nag+
	mdGkajhUBotJ4nT7T2Z4WF8iH9SvFCf6XYYSyej258Dj+pogq3QMVTBoM7tk5YcLfwjEaUMM=
X-Gm-Gg: Acq92OE8YPHfHYl0vJRvjDRdkAdZ1YTcmu2Han4TZIUCLy4oCZqT0EQoJX5/swBBpEv
	LkSAz1/Uhk9zohbhRls6shS5r5h5QPpGb3cPJeN5mW2y+Cl8e2X1GBldzLwGogmZVfdhBYldB/Z
	Gy2Mkmcu7S4/AdJqVKutwXsKD9roU3JHcm4D4M9XfSwT0LGXLB5lmnIJ4nSPuYWlzzFBf3O+v9J
	naI157SLFBAlPu8YVXpku4Oz8EGXBMsvkYeKTO4hAlzKnv/zslhmuVwWgj9T1uzIHbLPC1QdCm6
	mWg3pU11GUHgLzI3u7PFAz/PFOFNQr8R0Cv230Bwe+bAvdIN9qf7rdRIADaBlxzzzFEQueZHLaF
	OAPNiH36Fz7QcvWQY+zD4fs8gh1cXXkdIr7fymqpQZfvuPInGcg==
X-Received: by 2002:a05:6102:5e98:b0:634:92c:bdcd with SMTP id ada2fe7eead31-634092cc426mr1122839137.1.1778496854862;
        Mon, 11 May 2026 03:54:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5e98:b0:634:92c:bdcd with SMTP id ada2fe7eead31-634092cc426mr1122814137.1.1778496854416;
        Mon, 11 May 2026 03:54:14 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcca389b209sm299738866b.16.2026.05.11.03.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:54:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Jisheng Zhang <jszhang@kernel.org>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: (subset) [PATCH 00/12] Add TH1520 USB support
Date: Mon, 11 May 2026 12:54:10 +0200
Message-ID: <177849684249.46127.338857521767724625.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: ZLa3gyijdFf2m66CZQ36xWkDtlUl9Yu9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMCBTYWx0ZWRfX0v8BMbYJN55N
 STfaSujDu0Y60jMTR9XMg6XO/bxwg5vZ4TUQE27f6AlwJVwYBDG+5WP+bU4Gw359XDy+2kSFTuJ
 RJXbS6ptTvQhTOxp2x0Jdo13dbhxlOjBYx1Xrk+SocmMdZNJrJ4L/2s7yx91PzebCGrRyxhEMKS
 cL2qaEwEr0tO5rBYX8c15kvZhevd01GKQgggjsGk5MfOiM57EIgKyiw8WG2AeL0HCzgmAbQae03
 7L7GHcvlW21QJYdn5gxDr5HI0IdP8VdjnbOgWZIlkmgJyTcMhEduPEiPmkOH4tcUmXb+YEAw96b
 Cv46Ub+1m2OpYK2Rc2iMjMrEF2L110G8RNFXBjB/VrIdA0rGSH08+DHJyiG/luo0qIyORA+gqlo
 9csnIn3XD1+V6o1jWKwCtGKvxWbFXxxJGcJk7n4p7AfOCW8VxHoGfMeXoI1NB22awxJs2w831Ti
 T7lcxw7K98KbI8g7ihQ==
X-Proofpoint-GUID: ZLa3gyijdFf2m66CZQ36xWkDtlUl9Yu9
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a01b557 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Ij283RjCuas_M8ejfCoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_035416_593573_B1276598 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Thu, 07 May 2026 16:16:58 +0800, Icenowy Zheng wrote:
> This patchset adds support for T-Head TH1520's USB functionality, and
> enabled it on the Lichee Pi 4A board.
> 
> The first 3 patches add support for the MISC subsystem clock
> contrtoller, which contains some USB clocks.
> 
> The next 2 patches add support for the USB PHY of T-Head TH1520, which
> is a wrapped Synopsys USB3.0 FemtoPHY with a little integration quirk;
> the controller itself is a properly configured DWC3 controller with sane
> default register values set.
> 
> [...]

Applied, thanks!

[07/12] dt-bindings: gpio: dwapb: allow GPIO hogs
        https://git.kernel.org/brgl/c/f76c8be440e53465a306c95a7d50ca8675252f82

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
