Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD983CD4F4A
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4p4o6YvmTDOkACpE80K56wskDoJ1AvDDBW5KIuts1U=; b=tBR45M2ks/5siI2y2dPHIoAkWb
	qV2kxrZ0QbRAzoWudWCri6a7YuceUhCLj0FCPMADaH03WoUFg7V44Lfl3E/fr0btmaHQh+3HAhLc4
	txlGYIootd2BWQ/Ss8YoJp6NUmcwZR3+c4R3K5qLY7uR4zId6/C01ImMFwZsLi4O0iHhBZUj7ZDAX
	64HNFAPvpzcKcYxGXIXldgB+IDAxrPEGi6behJdN/a+m3frmKnnmSCKmmqMsbsUFTh1Z+JJsYWZgq
	Q2BWjbBEdZ0zKCrGOrLizIB0msZLlQVTuTGdDrDX/o2zFroLwmr7+4qS+OPcfHw0cbpGVIbShq1yN
	2EeHC2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2yW-0000000GbRE-3pED;
	Mon, 18 May 2026 18:46:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2yT-0000000GbQV-3RvK
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 18:45:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IIVlMp2483772
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 18:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9aPkfTUHaJq8jAZbP1lkuOqQeGCaA06/tOgxE5JXc4=; b=Fe7U63zmYXSVX3BN
	CKLAm3y4bEEuL8aOQ8T9AqrR5zrWlNA2Ji1FXWksJeQ/5mZEtlL/og/7A1WApcBB
	1MYel5qXI3PqPCQ1TOfdmNRakU6BfB/+2bWzIKvh6SvQQylm2H5eWNvgajTbGwfZ
	4qAyu/iUSSuyd/P0FENTrkLJ/g9izODzacYQztRAnW9z95ir44F60uS7wIBECdjO
	W7TOGS1RS+GLxAFkcuhgoLdH+rBCP33UoDOWjh82AL9Ra088JMFi2+cVOj5r/hDn
	w6ERWrmWuu6cUfFsAWi1m/OlJQJ7/jrzu1UxeUgBVTstu7KBl6NSXT3kupxOSGPm
	zonlAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvhpjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 18:45:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514cbe73d00so93497731cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 11:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779129956; x=1779734756; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C9aPkfTUHaJq8jAZbP1lkuOqQeGCaA06/tOgxE5JXc4=;
        b=Sz3vx/cEJ99Ur1CGS8CPtS8jroK1yUyUIaQlyqAvzDoBtAqRDr+Dgqpp02w38157bb
         inTl8ru/zNZMJdIHhyWxUFnoJ8+zU+K7GI0oB1b37IHJFzMtTumny3gcsXISpgxPyba/
         2vKrip7u4Jf5IoxSFtrbUCBKgFChlNi9YeX/lRSRfg5Bf1ZsNbl3FESbjcg1P8BAT7E0
         kmjRolk97sRNvYixeJfEZt3+jy0826oxptndBtLddeKhhjX0VmFqBdUKVUQ/xATOmQ51
         V8/CcV75+7jICt2TC15J9GIrvqx0IWlGrm+mI6ClmjnYxnp8XNZJyzMNRImdT2dlo7XC
         cg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779129956; x=1779734756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9aPkfTUHaJq8jAZbP1lkuOqQeGCaA06/tOgxE5JXc4=;
        b=NJJLSCpugH/8DNFAB1zFI6W7MKpBlfHVjUnh+mRNX73lvD91mdboV5vVnIRIOY79Px
         AAA9xqPP9vxO0jh8cJprNlMm8awPBaWCiSkoWqV4N3U6jjJrsteZKKETPujUOqt3a8qi
         u+R0GsU35OqdHW1AiaT46F1ZjsLitQCmcOyaCAUVA/eCuhqVqNv2ubeb7OGRh9t7Tmu0
         UfX0KxXWZayFgQz9qc6WSC20GSmB/RfbNUB1+RxEtr+/QHZmD4V5S2HxAYuXqQ6NJiXx
         9RxZSKmz2Qo4LudyhuiwTuD+DwIjUiaBpF2pQNxqDctdFRAbxNLToQxBdgEwn+15Lnb2
         bP1A==
X-Forwarded-Encrypted: i=1; AFNElJ8Ff7ofdyMqc86rGjMvdQ51WOc0ie0UWpMdvwx7QIS0JwjS6oMDaP4kqxndnHSrd5GU27DPPbHkzuYSZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZFCzyjzfnJiVXFgRfzaTmNRKhHQwTvYTQtIK/yLULTwK4MLUp
	4bqJkIqO6aE1UwkUT9A/FvLpRqTUSWx2ss7LWcQAOy7t7Dmk8tkdQtWX2sEMeGThH8YMzNYsBRh
	EaHztYznnFarAO6hSTAo+pfdbOwaMt1byLKaIgm7kAhTx3lqy5TCDRug3lWgaej14hJnyfbI=
X-Gm-Gg: Acq92OGNghoY/hxeRz7ignzWlfIfEATj69DnnN8zUs6IoMBltzn5jQLjAgXnA9W+PDA
	QS9jmqDQ2DMBtmaO5TqWr0M94j/BY9QnT/L2Q5g1zyITPCiXacchlC5Uy9NcWYeSyvooB+AV7vb
	0EV/DOp5OKJjSBqAJZuBTSVEXOYqedlx413cHUAiFVgeQaUWJeqA5symjfnxng1syj9T4i8hwCj
	lR/hPw9XcLS8vd3eNeLo6nCS2YmvYLP+IzQTEuxtdDj3WKVhtILxQ1EKLfmi8nhdXe2AgCv7mUs
	cgCP+9fZWhM7ag/VZ/PaoVoFUFjrK6zrpHQ2Z5/fwY15n3leYmGhsx79NNz/rZDrOEJNhYdJ4pV
	XHpAzT98RNHAu4/BnYUiVEQkaYr3lphVpHLl5kzPyvZTcqucBDclNwMJLTB8iOqhHFYi8dxgH8U
	nHx07lUi7ZkpLA/Ihc3dE=
X-Received: by 2002:a05:622a:2606:b0:516:4f3f:d742 with SMTP id d75a77b69052e-5165a01ed93mr213777861cf.13.1779129956030;
        Mon, 18 May 2026 11:45:56 -0700 (PDT)
X-Received: by 2002:a05:622a:2606:b0:516:4f3f:d742 with SMTP id d75a77b69052e-5165a01ed93mr213777371cf.13.1779129955548;
        Mon, 18 May 2026 11:45:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9? ([2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab6aasm292775575e9.2.2026.05.18.11.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 11:45:54 -0700 (PDT)
Message-ID: <fc43b4b6-36c4-4169-ba2f-3453657b40c8@oss.qualcomm.com>
Date: Mon, 18 May 2026 20:45:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
To: Shuwei Wu <shuwei.wu@mailbox.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
References: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4NSBTYWx0ZWRfX0brg4zDoEvqy
 cKZBMNvtFY8/ZCOPyLhMoMzYDKY2siP9b+9hCdHfcMW4y5IvcnZizUzjidgMcIeVit8rpeQAZbb
 1nHk03m3iG2s0X7t8lZ3ESLv256JcPD9USF8EIEBhdsg6flZHow7bOBEQFPkhqEX1UHFelfxe5o
 51d6mpkhq5V+qUI2emxD2YzYjg/6a4c6RFE/0BsxXqHBdBbF2HhFjWlsfvdF8fuJ97eOMDRstFk
 FHUoIQs4KUl8o3c44sf2k7X7ct6seWAmHpV3uCFiRx70OAR2vQTYSLWOwlseobwGusUCRzUHs+n
 c9B/FG5KUpIiw7RPKm/VQuMr7hucmdQZxfoeJIm2TZ8M4o898nqq5LbJRt3/SOS3iM4nxtWgZBA
 TYq3qlJAjxRpmslrfl3ZK8lBIqAw/YjE/aZMouAqSvtiocq+yhGa1pC/dXiSU5ltx0fAgUIy5q4
 PPxhvNh6DKKUC8SUOew==
X-Proofpoint-GUID: vG5SkLQe7k5GptefMZelWxTpzirzCDp2
X-Proofpoint-ORIG-GUID: vG5SkLQe7k5GptefMZelWxTpzirzCDp2
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0b5e64 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=GYkd94GAhdMpQ88-WtQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_114557_983243_20533AD1 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-pm@vger.kernel.org, Yao Zi <me@ziyao.cc>, Gong Shuai <gsh517025@gmail.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/27/26 09:15, Shuwei Wu wrote:
> Introduce support for the on-die thermal sensor found
> on the SpacemiT K1 SoC.
> 
> Include the device tree binding documentation in YAML format, the
> thermal sensor driver implementation, and the device tree changes to
> enable the sensor on K1 SoC.
> 
> ---

Applied patch 1 & 2

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
