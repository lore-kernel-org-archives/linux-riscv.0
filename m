Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CD9C88E64
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uawU5rJPxoI0iQ9BKEtA0vjyHJL0fqkwnKMrpiGvGno=; b=Ora76dH/5nnPMf
	QJCxCZ4OCWIW0JXUjtrf7QnkE/ZjVkyBKWgSdOi6jRYuuZWsHt+7aEPFRT1xWb/GfZtqiG8BwXaLr
	tV0rLJBpwLkoVAsbMMbOUJXwpii6TY2+jpK/pu6/WLd4CfhxubBEhsJNY966bG480Oumewnr9pO3R
	Ui81+CBfG9emCvHX8J3E1gdltM3erGgtw8KywE8Dj/DeHIve2Zbb8Pdp9PfWRJtxWiW54vb6YEh/H
	TP7uRl0qJVjjEsYGxBc6C3TUlAEFL0kbI8z728zWa/DtJRZtkTw0D2EDT1g6HPFt0Y4GRC/RlI5el
	vrmVRxffdxIIAxaTHkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66aV-00000003jIo-10c9;
	Mon, 14 Sep 2026 13:19:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66aS-00000003jHP-3Xdl
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 13:19:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0b3n4157708
	for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 13:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jTxHxmy+kUR6RRqJXD/5hkpv
	gyYXtelfKgZMuBm1egM=; b=k0f9OZ28aB1bOq9HwXQWTh3Hk9bS5SaDLuWQ+jzl
	9MkbLwAGZCWOujwrjWGXhhds07E3aCoItWmiTQeE1bbRdDnHltNto/ZkDcX+naUO
	HzkBUSjYu/00sWBLd7QwtnsF7HPWaFuXLFgkYPCJYLRDbJ8u6S9Jz0fj5RwjCcNo
	/jo0bUEvkVOl70GfNtOI3kl9Q40fygakA7NaddAzI3KQb+gpEX4eByLmE0UyXHBa
	ZtlMyzrxAlD6Fm5v2YXhsS+1RK+d6SAlINMumfPOPZC+yLTupH/CTIwuEtS0T547
	cqA6iAfp4eUauzW3hgAHHKZmFN1r3SfdgEIKZNwg2FxcAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f14rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 13:19:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8645a62066dso6847373b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 06:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789391946; x=1789996746; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jTxHxmy+kUR6RRqJXD/5hkpvgyYXtelfKgZMuBm1egM=;
        b=d5LxdU/ct3AcojBRPN8261hQoWrq8UxaGoocP7F5xMnWjeRE1r+8ShsCQb8XepDbhy
         88oEV+3oOEKNFL5osN/fPAmirf/JFmfKF/7gl+Grycox68+1Y7rPTjfk5b31aBVhXaw3
         RSoSNigGPKrF2Lda9qXAbQj9IAbDcszXH6Pi8vqn7jmYfLMWWolWabTil0ylQ8jeY+bm
         +/XVXD6KsSEGw+vevRnP73P4jHE+hl9MFYqUSmcNLRA/8C45BJSw98g5m1LSTjq4INcC
         JQLWzouQ0Y6w46XWc4C3/04uPxiX8OzqLxoZ/EtLb3AaHcpwnnShH+FfxFVT6Z7yIDAX
         vocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391946; x=1789996746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTxHxmy+kUR6RRqJXD/5hkpvgyYXtelfKgZMuBm1egM=;
        b=ogJXV1CxtroPj+3z06pBHEsUVqPbs9E8I8RvpdQAhJGz7xWFYyLgVWB+RUDmJPD1vK
         SbnlQ1rmktrpJl2lyFIgvIQ/78P8ms41Vz+uvZmsLeguytCAh9MzZo3S71TkG5Ss3bfg
         TJAsuLMBv1r0UA364v6HiysU3zY+68BbhZZZtXQcXoS8i/xs3o0ca8LY9J8+uy2+cfOt
         H2eT0+VlEWZKCiS9LEhiPguva97RMpxQ72I9V84n3cScLxeaS4CafUPinmi4I+shc4uD
         1tVpd2gHOBoAZ8wkJKzr/gSZTzFLmMuIgEpqvPZfJnnuVGcHlifrRLpzSRb8/vBDU8OR
         tyYA==
X-Gm-Message-State: AFuF++nTZyJ2/4oe4TN0i5yHwMDOyt2tBl2ux9Ge2e+eDEtCs2a43uM4
	rMnWGWKGCc4bwvui1+i39U0ctPuxCzscNPsnqUufe7sMU88EzM2/GsXvZTciL5NjeHF70ajMVvH
	OKcTFaps5w5ZlGBWAC+Bh8xo6Bg+toQDM1cokRt+ODXaU2r799//Qgwv60Uc2VID0N+7wII0=
X-Gm-Gg: AYBFou1fB1gZQgSZSrSLC4sRppa8YC0qZKU6oo2ADhB90X/v3bqeO0/NEJMMmTfwBo6
	dkdU5C19wN5nVirrpy2bejTSwh8E2K3UG/tWJyODl3Tgfv2J5ffjPOQ9y3oo3pmNqioEKAgsIJ+
	Wm4E7HC67kHZj3RLUOk8xnzmrjdqU5JeQ+2th/X4ivSyWTpu6sdbJVWGM/KFvv7K4B1bjHYzZgt
	WVCj0W6gE8vtwjZp7dDX1eWNrSaU1IxYEXZAMzOBWUNmobDXQGEbikGkPdLoAcdMZum0sqLmsVv
	sXXTUh9iAkNLwFapdnUXdBIZOPL/ROaFzj+Vg8sZaHhYv60vnGzKVNXU/aJ//agGv7swMIuc7cd
	AfgBdDBf+b1aBdmTd7JnHAxzoyfLQ0R+Re+AWeKrJfOIjmQBZGvbQxYZNuUsgjJ/1rBGTGodjvK
	l9FQYZQ+GXectaMiNgXoqGt21r
X-Received: by 2002:a05:6a20:939f:b0:3da:ec28:2cc6 with SMTP id adf61e73a8af0-3db406fc7fbmr5352319637.22.1789391946101;
        Mon, 14 Sep 2026 06:19:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:939f:b0:3da:ec28:2cc6 with SMTP id adf61e73a8af0-3db406fc7fbmr5352223637.22.1789391945575;
        Mon, 14 Sep 2026 06:19:05 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm26633558eec.25.2026.09.14.06.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:19:05 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:48:58 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        thecharlesjenkins@gmail.com, jtaubepe@redhat.com
Subject: Re: [PATCH v6 1/5] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <aqf0QmoUmkPUcCzi@hu-himchau-blr.qualcomm.com>
References: <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
 <20260911085359.95227-2-qirui.001@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911085359.95227-2-qirui.001@bytedance.com>
X-Proofpoint-ORIG-GUID: aq9P5Kr-t-k2WhNUcTipwLhiojVxVKqe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5MSBTYWx0ZWRfX4x5MNT8h0IZp
 QpZNo5L3wVh1V792bM9F23/YExvcy497tB/1qujzS/pU7Q4RlmrVhRBZCvufVm16JtN/Eiw8oCt
 atYTO3RH2oqWkRlcEY0UuyfDqFdw770=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5MSBTYWx0ZWRfX/SNYuq+YScme
 ucOf9tPjNimh9XD3ZWkwG1U+hqtXfudU3gf6GD3VaQeXb3sbm+Oxq3GvwjpQa+lt8CF+XfipdDz
 H2n9XrnPACYEYwNzcTSMM3aeBJYL8SA7PK43mJnDumoY1pLjif6Ln54A5Dbk7NTB94qNtgQ2Zkg
 ZmIC1EQ0wF5Ro+G277meWT08jrsdRDfBgX04Pp0ZiQd5+QG+89OtlA9RohvGK6USUmAuiqPlqyi
 Zb5q1tyPOvq25Gb900KuGgHAzOS/njrFWRbJO2ppY+6HFml3bkgjBNu70XXsqs+aqfD2Fk8Ak+R
 Zn/mn75up3QgicuTaw6tAwiZFW8aKw2sgpkbkOm3ZllPmyv7Q6NmwQ5ik2aMKJrnAguDPntqtJ+
 EBRX9jLXQ4JFSFOfbI8UMfP47qIqzhlWV8b+8HS42ObsoXHq+ELdSDfgiha5PT3+io4aMZLBksa
 MuoKBHDpzf7dubZ5TRQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7f44b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EuAT8bhfm2lHp6HEtwcA:9 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: aq9P5Kr-t-k2WhNUcTipwLhiojVxVKqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_061909_000021_2359C04D 
X-CRM114-Status: GOOD (  24.93  )
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

On Fri, Sep 11, 2026 at 04:54:00PM +0800, Rui Qi wrote:
> Hi Himanshu,
> 
> While testing this series on a platform exposing type-6 triggers, I hit a
> failure that seems related to the mcontrol6 timing/hit semantics.
> 
> The current execute breakpoint path demuxes the event only by comparing
> the programmed breakpoint address with regs->epc:
> 
>     if (bp->address == args->regs->epc)
>         perf_bp_event(event, args->regs);
> 
> On our platform the execute trigger did fire, but the breakpoint
> exception was reported with EPC pointing to the next instruction. For
> example, the trigger was installed at 0x1062e, while the trap came in
> with epc=0x10632. As a result the handler did not call perf_bp_event()
> and the breakpoint selftest timed out.
> 
> This does not look like an instruction-size matching issue. The trigger
> itself matched. The problem is that the kernel identifies the matching
> execute trigger only by EPC equality.
> 
> For mcontrol6, I think the driver also needs to be careful about the
> Sdtrig version exposed by tinfo. With tinfo.version > 0, bit 20 of
> mcontrol6 is no longer the old timing bit, and hit1/hit0 encode the
> fire timing. The series currently still defines/clears
> RISCV_DBTR_MC6_TIMING_BIT and, for watchpoints, only checks
> RISCV_DBTR_MC6_HIT_BIT. The execute path does not use hit information
> at all.
> 
> Would it make sense to make the type-6 path version-aware, or otherwise
> avoid relying solely on regs->epc == bp->address?
>

Hi Rui,

Thanks for testing this out. I acknowledge this issue. Similar point is also
raised by Pei. I will fix this issue in the next patch set.

Thanks
Regards

Himanshu
 
> Thanks,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
