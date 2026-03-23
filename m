Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C12D58CC5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 03:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aILfj84PUwe4tf53dmY+pkZwPaB+4zmBTV0O2q4bwIA=; b=Tw8JfOuxCkCuj3
	0tiAHB9xRxw+7v/8WYXQv4zW1iwXLGjnfLkN4ZppDGQ8qBNFHOUYDPLkEGLEyTOkjWyJsuDcTpDgJ
	VIMJgooYf1FVeNpCMs+RyTTtifdRsWkXY0mZQU8aXWWxBrkI7kJGe6syVifFjcff1LbW2PqLe/Ljq
	oenDh933yxVkTsZbEkwnchC/PAo3EEWj/oGBlEzWTuvT7T5KZZEBJbAyn1a/s+TmbLifx/mZQ7Yf4
	nWkukwNGbKGMjPURp2Q8clkyEpsJFf4SrXGa+hxB9vCibzTbvr89X9Re09ZuPNJUb/1cgI3nk5Sf4
	HLW+irQ83G2zr7BZCY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WLu-0000000FxyT-3Yj0;
	Mon, 23 Mar 2026 03:53:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WLr-0000000Fxy5-39Tp
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 03:53:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLtbcc3385863
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BRaKz/q5ql6Zi63D2ehAc+ss
	ZqrmS3p79ukhpAexd8M=; b=kmEDGuXRymGHdsP0ecxqA9+LdWHaJO/4NtUdWjho
	sEphS0i9NpVaEs4FEZ0jMeh3zUSxajqlELWcz8WhnoMpno0utxKRQ/zskgCZLk7o
	1l8+UvnjA4qSyOpJ0xqssG9viNSef6H4s/rv7EivgWypphIhKbGtA0uGs6hwAFOG
	YoMpYclPKWX68qZH3vvZtouS6mEe1r7c9FwRTNetvSIKJPCfTl8brb2MGaX//q0i
	N0xob/f8vVbhPVfU1J4zFFRV+M9vhwNGj2LOpvf6t2w41b3KZvSlWEMfMKQRkLt/
	4VqqXVy5KPu5PPCkkuOOev6pTbEroXSTn8Q5adpsN55JTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8hjcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:53:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso24101441cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Mar 2026 20:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774237994; x=1774842794; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BRaKz/q5ql6Zi63D2ehAc+ssZqrmS3p79ukhpAexd8M=;
        b=fmsw+oKi/2fdELtTvxw6G4KF+QAjWMi26qnnFm0QJT60oJ63cvFLw3qhuf4Sf2JNuV
         wXEWJNjUxhinwP5qp2TZaFS022RZFvVLOSbtfLllqYq33juPyarqfBLAe6z1yjDx78LE
         THy5zYFhkipcNP8a+PyDE33OwhZ0eauVOcLxo7sJn0QJukETyJZhYhfuhzL0hwpuQmzr
         rX0jwyoB8L3hgqSRogWD1A/9EAQo1JhmRpaFV0fSqJ+qTrt5YvJWlUNJ3ZQH66xfZqb/
         eRhPtTArCldsNQkXAAHvSJdRCwMDI7vLaDX7/vQ+9ne2oVe7hzkVxufuZ3qM5eDI/aJV
         BikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774237994; x=1774842794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRaKz/q5ql6Zi63D2ehAc+ssZqrmS3p79ukhpAexd8M=;
        b=DUpiAadXlYZQDFxymnyJn6+E4+jHXGUuP0Y6Yrat+9YDyI+ihPgtIXt50cm5eercd/
         UuA6lpxbjqBEQ9tOReC9EKY+BjUn5pfSkk8DqZGRAocF3Z5fIRkfytjKCooRx1R4a2JH
         jhYlamD/fA1vSiFTsgXofV62HU3UryyaCvKQXI+zT8T7s6cqBTORKl6ar1+tzU9MKiMa
         LTlJ1aF1hhoNJcfyjRBMOTIDjk7et+YQj89VqQnmtKijWPzKNDfS0V3+hrI5c1C4eyvl
         TNXMswnYbY0lPZyTTAza9tNTb6xL3vtyFXGgkwgLWyYDOP2urpsv8b+OwT4JHDybcfxL
         87PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe4Hr1JoKowxU6KC/r1Z+LMpoFUeNWmdP2WdBGmlozHn4h6a3cuHGQHdB/C4XmDRaucMWFot63y5keXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqEQNi9nS+5bE4iuaUs7YxZpOJsmPYOuqw6ljJ1v2d3hiCi85D
	/97yJbDQx+z1PuKgtpm4j0cUML12zclPG1Yo3xhXCBig3rm3nkzOV2e3Wvv/gCoUBSFhU+eY/Gu
	k2TQTBBQsvLDYhc92h7oQRsRdTHY/d+XJ5X2s82VqNYDqplc+iiOHDokDQYyXtyelaCZ2MRM=
X-Gm-Gg: ATEYQzyUWGFsF9ZU9r3HeatiIRwe0FJD35rw69xCzQjtewFjIy7cmDbDUYDyBF38bcd
	ePdFV9jNWwLeqhguOGNVIJy8V8WSuIOVhOQ45CP89kYyy7xd+7FEtSEGIk9QmJuVSpKo2JdgCvV
	ZRLP0OLDoCrK0Zru23PkmfrMJPzLsQQis1YMhKQG4od7XFPEctNPnkE7Fv0BasOczohPxv8rv/G
	zTEB/UpDkD/frT3oHQyGWb/ga7HfIovwWGR3k6oa/bQJTp3UeNEJersOnKAxuEJGShq76mrwGGI
	x8oX8gIyMNl/lc+spvaPdTJNnUyok2Vb3666ckNv3uyfXDqAzL3O02EZa+YLTulzZv23ZmrWQqO
	kh14Nlj063PwtbTDxOE7aIekBkBidiwKBvw7gHfpPnksJLgpsnZV+F7ylCuScFp4s8mlh1LAlgX
	F0RRLNR8O1wDO0LeGdu2eQKDXVsw7s2YubC84=
X-Received: by 2002:a05:622a:1899:b0:50b:50a5:d61e with SMTP id d75a77b69052e-50b50a5dcd8mr77271791cf.17.1774237994156;
        Sun, 22 Mar 2026 20:53:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1899:b0:50b:50a5:d61e with SMTP id d75a77b69052e-50b50a5dcd8mr77271501cf.17.1774237993683;
        Sun, 22 Mar 2026 20:53:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf97594bdsm22624371fa.14.2026.03.22.20.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 20:53:12 -0700 (PDT)
Date: Mon, 23 Mar 2026 05:53:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Felix Gu <ustc.gu@gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: th1520-dw-hdmi: Fix remove() callback
Message-ID: <443mi7an5qyyjol4s2wen6oten56advyzs5sbxxl5tbdzcoork@farulzm4ygsj>
References: <20260321-th1520-v1-0-ec877197770d@gmail.com>
 <20260321-th1520-v1-2-ec877197770d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260321-th1520-v1-2-ec877197770d@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyNiBTYWx0ZWRfX0nPXmjlqX/Fk
 2y1SOBXKCzrpBe3T+B0OHSIcvhJdkoge+Hvr9ciaCfB5OsbhuRDRSiFyQ9+Rptj/dv5yBTxFrrH
 bNjNV/1Ip+iCycfz/8LpGlBKi5LO379dKDr1O304ZqEF/hpBIXEK6/JLt4zJLItGyadwhegs/UA
 P1yV0Ofjra1aQzNoxlSDQJBYQI4P9sqPhOwQgH2QebwdcIBTDyQYe9lE8UkqC0Ayax5zTJQH0dC
 0x79fMdsb4d6tKUxf08yOtPn8YXwX97OMbOYXLX+V+1GMXXpP+HrtSnz8Re3ZJZJkXcHlijgymy
 5nXpjdCbjAlyTIF2jfsOICXSJ5luookZHfvrwlBFKkFyo+QdIoh3SryaWZ0CUpkaozGizY4JILn
 eZPm4sHctVj7dch9FBQaABIlNuk8CS7xmUn7qYJMmJ2BF6NJjX+cjne/DZ0+oRA9mEgl8f45ief
 MPaEg6WwH6ZjxAx7ExQ==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0b92b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ZRtV3Kz9z0tY375oaq0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8t-6ko7DeTAi6LymOhcGISGsw9TrjvWH
X-Proofpoint-GUID: 8t-6ko7DeTAi6LymOhcGISGsw9TrjvWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_205315_807068_B6BC61A9 
X-CRM114-Status: GOOD (  16.28  )
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
Cc: Maxime Ripard <mripard@kernel.org>, Drew Fustini <fustini@kernel.org>, Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>, Simona Vetter <simona@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 21, 2026 at 03:12:11AM +0800, Felix Gu wrote:
> This driver stores struct th1520_hdmi * in platform drvdata, but
> th1520_dw_hdmi_remove() was reading it back as struct dw_hdmi *
> and passing it to dw_hdmi_remove(), so teardown runs on the wrong
> pointer.
> 
> Retrieve struct th1520_hdmi * from platform drvdata and pass
> hdmi->dw_hdmi to dw_hdmi_remove().
> 
> Fixes: 96f30ee0fb9d ("drm/bridge: add a driver for T-Head TH1520 HDMI controller")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
