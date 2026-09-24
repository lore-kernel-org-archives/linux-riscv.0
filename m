Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF40C98310
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 07:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vA+uPQVnZ1HXlfxbpxQJ3/52c+xZEgWHJWslgPv2X8Y=; b=QPRpSvBLISrdfR
	WDDVkOzPFR+sHJqol/iEikQwLwXFYp9Xk66VWEOQMPh1bTEjiA4CEhlo9zz7PiMP6t4EwTfLfzoJY
	l1MH9MwSFe46CsCA/4voIYVXr2X8IqZvdVyDhAH5Qa6jPsltteBhY70iveGYYS4yrd471pbYE5G7m
	p7l1nWaGfai++c2DEw0y2AVD7Tkoo4+0e9HCmRK7wh5YZbXbcfYYRTaCC9YSE54v1B22jmAvSQyrW
	I6wv50Ku4mLLlg/REcqq2+X+lviCH/zbMsawT5RA1ex45hiAucP63b3oeltBKH4Z025jOAlE4yViH
	CNsFCKrC7dKeEdhYa3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e2a-0000000AJYV-46Dt;
	Thu, 24 Sep 2026 07:39:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e2E-0000000AJPV-43Bf
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Sep 2026 07:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LEuz0IYkO3vv3NkIV9hKvUGxpNw0DLo4XFrqlBEvznA=; b=RhbYb54uamTnnwSoAeYKWM02ST
	FTQM9g5mMuVA6BjG1Kkc55jjuEk5qiaAX0ViQAT6Hk52bR0s7R1H2Lbn1duGYFgF2+OqyR1pGV8L4
	9mgd42TSe4T3TjtWTDE/Ey1EElI1QArJ81FPcufG/ckw3FzDse2WCLF2SUe6sheJYnCCu4yBE6EUp
	x/umv35orExDfde1jtuu6oycEabwUiFcJcgchNijFZ0kNhAiGJOZekecE+kXdI3d+4YFRN1u9IG3G
	CvNW8pq2ToZ45pOQwf6if+NlLPbnaG6BjulLS4QTAdfdWgE4BQ6p7l1mM458zzw+fmnZYfnMbv8fU
	QVRnRWIQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e2C-0000000FnvX-02Qk
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 07:38:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e9iI2420874
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LEuz0IYkO3v
	v3NkIV9hKvUGxpNw0DLo4XFrqlBEvznA=; b=YvApSJIg26yiUkCIqtY49o2Rn2S
	RQZLEU/0abNuxebWy1i691/5YtILrNLLRVrmrdr0Zs/dvgXDOj+HT1Mx7i7YvCwt
	VqSJ00sq6XIdnsMNrLa38U96SbH/QtvcrCz5HRZXMI+OWyOQb3tcIE5Se/zls/z9
	fH5r+OhALjcfF/bOM0BCBSouBgsqHyNKQGnx5ANzOTZi57NUdzqw1TbwZOetXhHP
	mUAuO9IzAK+kwKxdqvtlSAQ0RNPttMR6f8ilttFqK9QY/j1+4UCSTPnbPIMC/Xih
	DTcrRfL0m7D2nGcBTIifQyTDXcGFmkdVdj7UwWe+NdWfMzZI4uxzAc9WlcA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuhahc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:38:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3003576eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 00:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235500; x=1790840300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEuz0IYkO3vv3NkIV9hKvUGxpNw0DLo4XFrqlBEvznA=;
        b=Y79G25KvtCLOAOVyDl2CxMvanPONuC6rMu4tQmg7Dv1Qw4CVL9kfkJxhO4ontTLP6m
         QO46t9+YRV60D/Wot+iPa6cgEYkbYay6/lZpCF9ZsRGsxXJgMx/7oSZmUI0qXtN0jC1W
         Nf8+od3IJoXwIiS7FNbm0ZxtVnDb4ZH3hkmIBiTLk+gACozNJ01TAuUHNLtH2qqnc3jk
         dF9sonuZfiGvvjZaxhML6MC1KW9xShX6Yx3nVBENd8ntyeNyzHk2C5Sp2oTvRzAo92Ug
         rM6Wv8Q99PBmAdN3xsyTJpz2Fdi9pTvl/xfbef/Bzt13kUQspmJB2sAnoEdSzeuE5/Fd
         bmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235500; x=1790840300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LEuz0IYkO3vv3NkIV9hKvUGxpNw0DLo4XFrqlBEvznA=;
        b=GaGwgNy/rY+AI36/tarlX5AOOodqX7XmaL9r6aIvM4LoLV0kLGzJDPKDnVDG/Im5qc
         IX6EV3yXaH8zuLVvahZZES0fDH9BjjbW/Z1ujxAo1Ud6abvnlvP/Xt51XwVNjdy42zlB
         rHONb6FbRgL7N8R/sDojnuSv91mMzJ0nd5FkM+WQ+sdWJkmqL+BOY6Gjv+dICP5uA/ta
         pEatfJ+ESdK+3j3A6gzPL7eJKUQzFQgHb0fdRzfoXbm3t/GEoRaSDSyOOlPTYsw94Wb5
         DLLSQEae7BSOP3mTFiaQd/gIDRjjfkyZuaEWfsfheioJ/1nRRvrzhNNWemxnDDF2cgGf
         bdaA==
X-Gm-Message-State: AFuF++nkbXwS943GD9eohP2dIqfyoFL/FOnRdxWgcQZT+Y83qa6OnL5h
	q4/9Ga5eINsZInrgvaQwCneZWbscGGl/qRwiniafmawoN4l8Xy/HhrHZ5ti7XeUqOPLohboPuzR
	nOl9UDNcUk/BGeukp2h9PYPHdjGu2qsX0CmX0gtpfAPXmgu0eCbFMsTwT9L0rc0gnQ9Y5p5svvP
	xmtZg=
X-Gm-Gg: AYBFou0lYoxUU6t0RVUaNVwXI17ju4nBIJJ97EXqx0VKoXiX9NJOEnn6LQvkUsKcE25
	j2ebYdSocKMNns8FHtn7tpN6IMuZ/ydPPVSW8L7oKbU2vOZj9ZIr7NIc5+qOm5sqwh4nf2ipUyH
	h04po5l7VhafrQbl1brJskanUoR+w30HAEsYYmeK9J0w9LbH7aIESOGKcCFxWbneC8YzT2vpV3K
	XEQEVFYDO4sIS3pVqWaUUWZrDv/uC5ET/DfAoJulgcRseRv2+7hle1FFLvTcT2orx4CpJQ1f9Om
	vi6BW10sVWcz9HIKRrsJOYbaG+aYzWINOrv2mn0ODLpTO5T6PIXzH5hvFmYnPK/I31D5wx/ntoq
	aPxBteMrgx10mNET3OQMQb2ziVZzfmNWHh1sljzs8m+t6GVDLweKnRDZRtUakDHmWbayZI1FJgI
	TPaDuH25cr/0P8rwaQDrOgwQ5J
X-Received: by 2002:a05:7301:4441:b0:33c:1ff7:8681 with SMTP id 5a478bee46e88-33ffee597f0mr1649402eec.15.1790235500334;
        Thu, 24 Sep 2026 00:38:20 -0700 (PDT)
X-Received: by 2002:a05:7301:4441:b0:33c:1ff7:8681 with SMTP id 5a478bee46e88-33ffee597f0mr1649373eec.15.1790235499750;
        Thu, 24 Sep 2026 00:38:19 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:38:19 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 9/9] riscv: Enable APEI GHES driver in defconfig
Date: Thu, 24 Sep 2026 13:07:14 +0530
Message-ID: <20260924073714.1650588-10-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXxtWUlscCE/lX
 aSaA/jWVO3sw8bbfd5sGTt5EPKXZVGjU2SMPxvRVLkXsiZUTY2nC1muNXPEvcdqKmCfzLd58dBj
 K55bQ7Ai08QsdSAYcWhyMG91qkyO4mY=
X-Proofpoint-ORIG-GUID: aIkZSqNGtrzOOnGJWwQBeNu2tC1PeNtI
X-Proofpoint-GUID: aIkZSqNGtrzOOnGJWwQBeNu2tC1PeNtI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXxLoBulvL/HiZ
 CG6V7jT94wAJNB5WpGltSbj5Nou5NAIwaaw/v8RjTr/aPbC7/cW0nAWhNG79mUTxqfvmBwCh3z+
 imgxi6ckr9paTmFBjEkpGmw/WRijtBtx1h+/Y3EfasFoV5HQ1yQ38ypDwBFC5uBgXybRBwo03Gt
 1/4ilAESoeteyZUnu+CfVb9t/X/NN/bF/HaoGj1iIS034OiBhwQEZwekdB4ijfuDQuq2UOqzpzy
 czmqfYolDweKB0jeoy7jN0GMFDqHUT3ysT8kemD/zKqvz/AmVckoc1QU7GMt7eOxCRfFvlicuyg
 yXW/ZZQucYsUZkrtC/YfJuN7PBvqerKcKunevOJuoOqk3mytHKm1mtz23ENE0trnizjMA/16xwy
 xlyBTqrKBJHwSmmOd+3yfteyTKKNJwOnRFsb7jDYQftb+rflcEOPxOemgZ08Q3HctR8FNasm0Io
 /bcAec63chS5RGo8zQw==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4d36d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=xUlk1AThICIXWUt23vsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_083824_387043_F16C4641 
X-CRM114-Status: GOOD (  10.61  )
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

The APEI GHES driver is very important for error handling on ACPI
based platforms so enable it in defconfig.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..66353b22298f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -48,6 +48,9 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_ACPI=y
+CONFIG_ACPI_APEI=y
+CONFIG_ACPI_APEI_GHES=y
+CONFIG_ACPI_APEI_ERST_DEBUG=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
