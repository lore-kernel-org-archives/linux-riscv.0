Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F783C5AC67
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 02:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvJglmVL91dbkDuzN4wrDpCewZ9T029hWhMBNmih9gU=; b=qF6+5QfyWH9pBGB/fLOOF/yo8v
	Td8IB4SiK5hjoQyAEImoLapznhAL2yMMrN3hXdb0qWV1CM1taQDCQ0KO2JoBKvGvEqZosyrVmgaX3
	FSoIkA8IjC0VOlBsV8S7F32N6BO88FrU6i3qINJBBoPVoWt6jNq8/1LUeOnz3zuBI0SImwI0zRawK
	RMJrGGyI59IDTn5IxX0hiYegdoixlBZ9kneSomsxd0jl+ME2ZaTb5MbepVFEReGsEaEqYg0QToToZ
	pk4MmYFaPDqm769G2CY/qb13kvpTGzg78YtyA00yEaK/IfG1Yx96fWOkF1F/RWJtAEdGo7MyiUitn
	zVoHEIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAGq-00000006yki-3Yu5;
	Fri, 07 Aug 2026 02:25:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAGo-00000006ykD-1sFs
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 02:25:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GfHg3533322
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 02:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sME6dxu+lP6XRSMrnAXeehDIBxuMJDmF4YYzKVgdqY8=; b=GeNbwbjO1fbnzb5t
	aR2/MyUqbNyATdthNed42sBhG2Tjl5Ie8RzmWkY5rKqcw+7O2hoo7zJjiIpscMEF
	w7Eej5wjbVLP6QHh4MiYOPDX2RrIeyuz4dznxS4OWBtOYeOwi6DwZJkObJK2NE62
	8PogpSC2dRM+2SJp13jUINMPPHCWw7UtB+gz9ndEzy/PLF3VtiqjNagm291VA6gL
	VccoHR2TlXOxZBRsvJmGBEAxtB1kpstoZo9tfOBRXpsCibRi3hdx7J6GJzwEGijm
	nqiXoCABnCWoKYgVfDsjgBb3Pe3Nd5gLjmcZVXe/vV8OKZQYlZ+llynFxTgcs8gx
	cPmmCg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fsvfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 02:25:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52769fc3f2eso35277951cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 19:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786069512; x=1786674312; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sME6dxu+lP6XRSMrnAXeehDIBxuMJDmF4YYzKVgdqY8=;
        b=Ed4R/fF9g3dBAo1L1I74eCzCzIuYznDkPjMR1Kk1HWotdM64a9R3et5EkMvi/nK1JN
         uPuOIDeR/3eLzAJb9pnfwJaO/kLpe3oXagXl4z99MB6rWhOYEINO1wYfkgNSKhVD8CYC
         KjvtvZ+VD6kuLmkFi7ToSEhGwz+6HEedq01wu03ykxqjTg5BZjn32iLwzj21rF5Kkhv8
         O/sghjJgy/tqJJbm+Mm050bJ2FPTM+fg9SPwqGy099gUp2R1N58DUP/tu0rKgCJdwKin
         qDq/6fhrVarwvnrwru45t5yZMfQSwBLYlhtFN3gBSZhYY0u10fwCWPFxUwcP97hMXAnS
         hEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786069512; x=1786674312;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sME6dxu+lP6XRSMrnAXeehDIBxuMJDmF4YYzKVgdqY8=;
        b=QVmlSGyCpr2pq6lcR6NPss3hQBzs+b28MNv/fsKJxlHfNiFCIPCl9LEJDVS/yzm6+y
         N1lHxQXN1m1prA6XVSIdi7UqmIGw2+hxqncaFnkjUOYWedeGuVgAng10uKJVMjuk8pcF
         eL5SS7DB7VrxbbqT5FY3E6ZC21NttZd3FARQx25709+YajZ5Xq2qKfoKYYUcJnaZWFcr
         Go8ULeIitqqvs59zM64er23/ETd31+PWtGl1RGRgtgMO0baa5pb0P8K5ugAZRvvPBtr+
         jOkK7x5kKzaGY+2Q0kPJ6RzetmY2h7Bx4+lk6Mh9clBqfHBTRST+H8kfHr/c214+ngmC
         q+OA==
X-Forwarded-Encrypted: i=1; AHgh+RrMBgHWKskMJN5lFcxTaroG3j6SDWVPG//9lI1TO/lXS6Jms6A6bc3mK/daC+rNobD2ggbo3c+O6dqlIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXur6SqweqeQvbJfFRxJDTIYEYzSsbEFKK6y4S2PTle3QGPQD/
	wsjzuycqpe25CDsBEVlZwLEHuwjs6c8DdM9NJi/7xMoEtxfiD9n3RIinyCSE7wTiG/zOLtdLp7f
	tIPvgJRTXlhzfsIuoHVG7beh7JsEmW4Xw1I0xSySBnd0IiExUbIFC8AJvQNZqabm7UmFkDwE=
X-Gm-Gg: AR+sD10Hj5D3whA4Ka+wn1DVE5tVnv5e8bme/FbMD8tdQuOFs9v12DuY7cGuye27Rbq
	STbNfy0qr3yqQUmDlNvnHimqWRcDgHzwFx1Qnk/8KEiYot6hn8DDq3LQK2CysnE8m40bClopj5i
	qUn9RuucxNIn286CV0qT33Pp0QiOQ6D3JQVi6muMqxodBApK1PbEBZ8K3AOS1gWPVeP7PbogTqa
	fNDbjPAKaW/rmwra4XRL4DMpanWdBmd3QLe+Z1X9HzHE2Bccb2mBhVtRM39+ZEnIHuzcq392lAa
	6AuOWcMkfOzkQ4j64GC3k3W+p2MDkFzLs1Zxtp9hJYgPxTDLhfVA/pCJgBCWapSpQ2Lej5ReOlo
	O3bxy7eg562TF3yljSWj5yhX+UZhFSwRvVDtfiWg/Ipuwyw==
X-Received: by 2002:ac8:7f85:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-52ce6200bcbmr210648481cf.41.1786069511691;
        Thu, 06 Aug 2026 19:25:11 -0700 (PDT)
X-Received: by 2002:ac8:7f85:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-52ce6200bcbmr210648191cf.41.1786069511316;
        Thu, 06 Aug 2026 19:25:11 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995420bd1csm108881935e9.3.2026.08.06.19.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 19:25:10 -0700 (PDT)
Message-ID: <0f8f7fb1-1138-42fd-b949-19e32e61917a@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 04:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thermal: spacemit: k1: add shutdown action and reorder
 registration order
To: Pei Xiao <xiaopei01@kylinos.cn>, shuwei.wu@mailbox.org,
        troy.mitchell@linux.spacemit.com, rafael@kernel.org,
        linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
        dlan@kernel.org, daniel.lezcano@kernel.org
References: <1967d2bcc8fede6fbd25fc8eee07f2873fb41472.1784184867.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <1967d2bcc8fede6fbd25fc8eee07f2873fb41472.1784184867.git.xiaopei01@kylinos.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAxNCBTYWx0ZWRfX4UUYlMGGwwSC
 wySs/i+3VzbCNBGFwGiCcBLCEYZt+/Iab0JGHG6kOG+HwUDTn37zQlc7Y9cifvMsGlHLvDOdAzt
 unT8onOe3FWDpl7uv37NO3cqfb1rjecNObNE8rwm4RosPDY7B80hX6u/aT4RWM4/gUa0XMftSJX
 npWYFf+fyFmhx42GMqtmfTHppdYOPx0cL6jSU5cO8wHwGCv+9Gt1x4AEiidSgiBUvyBdO5l7toN
 H80oNXfYZ7roylA608hGYENTctOw8OvITGmin9mz+cUQrnNB6K7z6QWdheQkcT3Zhgxl+Qyh29X
 j3DuYibKBsmnXqwmDJFSVVyjw8jCWKuv9MKyEhz2QoXRKNZKiVXYD3apRQwNxXFKIOBrthPlInc
 jt505qKsJn2n+xnqzzpWkmlgAJaVptosRKiYFyyMp+KQm/cJ/ezoS/MsicvdfSgas1wRf0d+rxl
 mL1OMYV1VP0lAeBeTQw==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a754208 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c8bhSAXnGUngXy6NwXgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: PRvIAmzykv-Gcd9qBj6WkYQKYOtz8COp
X-Proofpoint-GUID: PRvIAmzykv-Gcd9qBj6WkYQKYOtz8COp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAxNCBTYWx0ZWRfXy45858s9r3X7
 ar+9Ys9ihG2jkOC46qme6lwj5hlEUroe3zi4M4rlUv3pcpmXrzihU0YXg6yQjO0K2nd0lEbh9z/
 SJVV/cInyc3A0JxD8DDScoV+rjOa4kw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1011 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_192514_607926_D30B2415 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/16/26 09:04, Pei Xiao wrote:
> Add a devm action to clean hardware interrupts, sampling, and control
> registers on driver unbind, mirroring what k1_tsensor_init() sets up.
> 
> Reorder the registration order within probe(): register the thermal
> zones first, then request the IRQ, and register the shutdown action
> last.  On removal, the hardware interrupt is disabled first, then the
> IRQ is released, and finally the thermal zones are released.  This
> avoids the IRQ thread accessing an already unregistered thermal zone
> during devres cleanup.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---

Applied, thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
