Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05433606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uYg6a+jH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aci266Nc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J34eyLLK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g80e/85rn5gHyyi1tfpSxQFTcdfHK1HMXwKE8qw9mCA=; b=uYg6a+jH5hrLmrYMjvZ+CdsN+P
	+QFoQx3sPWdA8OwFXgezqXjvV+g7E/CBvdhWrsksnV1Hk/Dl8rVVqGO4/Jnh9Yr+QvJasqlvm/QY9
	ceJj1xxer6IvIFkUmlJg0w73spzpLxy1FvbSeQtQZFUyMJG2JPaIVZiw/HVq7PIo9KbisylJxmP4V
	i18TWZHsv8YEzlj7Mdm7jTVgw3NpZL821qQB0DpemS2MRhzQ4m2ttVIIt/ZmqrlGpCrTDOwoOIElj
	Byugl0KRJhNoFnEmR0r+Gcs/q1SEyNaGTs5X/ZITOLzbhTmaej6SdJDp78Oqvig4aCIWxEn7kx8pd
	In4dLTsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGDJ-0000000AdXZ-0sbd;
	Wed, 25 Nov 2026 16:51:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGDH-0000000AdWy-0MN0
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 16:51:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQDsZ3230251
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 16:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FxhZu4tjMNL8HO5R7YNd87cuSZ/6nrHHIXT9pj3D72k=; b=aci266NcO9IYDL0H
	BQNF4F3NGya0s2kqOxtiwfJ5VCyiqQqNSlmBGyKdaKNfwjm4DTxBn7zpw9vnxO94
	Hneekdz2dm50SHEC63I11aGC86CLZgKcbTVbobCW7AyB4bm9XDyru47RctUMI5so
	+hRq2XNzMVKxEGTKJsiTgoyBNCSia/oOeRz2cj6GDFjhJ/W5JXSPhCV+j3J8qMbu
	YFdYqhiFkHxy/y23AC7jObddBO5MHdP0xWfuH4hFn4VwYvE+SJYmucEDNDj5Cjw3
	l68UIJ71xaMA2ZvAItl5Oxb62WeFTq5l0dCDvFoPX4m/WMhUyr9nohK5GEshIJR+
	vhjgrA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6bj62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 16:51:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so2001549e0c.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 08:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795625476; x=1796230276; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxhZu4tjMNL8HO5R7YNd87cuSZ/6nrHHIXT9pj3D72k=;
        b=J34eyLLKDpPMDlnFlAec+912DdKjVbA9GXzOCpJOPLJPX5xBKVC68+e+Eem5zUhC1V
         cyoSRA4wWD8IzxKGJ8iFjjDaKDb2z0olXu1/snaH1zXIGqiNdJHDs4rTYx+8FF1ClSsv
         Q89QUj1mQkevfAUO7vf5pa2vVSHpcC2uVbkHFQmsDGhtrWetXacoyo1XcFycGLotE3O3
         5EYjP5CM0pVCSBYR/1UZLJBwlng49BL/At4DWi/l8NfNk1oMJrt2Fl2pFeuBOdIcI743
         VeuDZaPX6mnp5Uqctec3cCLbR4nD5VE2dlzwwyRZGySsVI+PI6k30UwNxQrybn3foRix
         feOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625476; x=1796230276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxhZu4tjMNL8HO5R7YNd87cuSZ/6nrHHIXT9pj3D72k=;
        b=jhfe3q2b7smYHQePMQ4rrnvkgrGyRqevNzIZfKbMXJPS/CQxJLhmDzwhYlIMZlagV/
         5gsFxq7cAG4VGR2H1o39qsAmVppSqskuMqUzkOZUTQsrl1gl2mm4mZwL3EWfXYc3bL8q
         Wb4PMj/CAc4sWdRfEnbzC6fJu+0KSrGZ4RA7+rfI9TUpdzty+JxibAn32egXLTUBrejH
         lvwaKAoHhHayZpdWIHopjKc4GKq1npYp2RNjWVFbUOJvCkKP4m1tq7AvWU+vFSm4GoK6
         mkmzOkFMAZp45xh8tvubC1ixNiFypM5iJhS4htydP1upvSpK/Gaw/eHFVPxIDV1mvW5W
         a+fA==
X-Forwarded-Encrypted: i=1; AL+hErGMUc8FeSQKOgsAhli9YFkKAJfJavXmR92yDMaYh0Vagc3eUJIeH5bADSzmRaVe21gcsrH8hNBCNLYvKQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+nv4j/U/7zyRfsCIYpZ4XwSIdLop6dRPrL++W0gsPWr0R4jFir
	zRD0v5PBPzXSEuLYWeFOrrxv1u8aySSVwybFZQy0gkSPVqJFKqYhTgiRabw9jYum1zQImiT2jwJ
	FlZoAZ60hzasUOUG7gFajkvol3u7Fxf128MrE/7dmY31+RPQWeMydTFiLK4fILblQt9t0W0FRT2
	YnEP4=
X-Gm-Gg: AZFdTZdtxNMzZrJzQMrXxHGOYmIHKFajNNUKWwlbTr/B35kRqSDLzHQDNYB0IKJKZKS
	J2J0PJp72QSr471yO/l+AuJjYFxNEnXtJyERWWPWFXsYoG4vd7qy79Kdr0V3mF3SdH+wwM745mQ
	6MDMd3uVxigT+nYg/X5lx2ea63K1OajRTlJq9Gax2jQ9UDoulVjIwAtDz7MkIMvEPF3rP6GT35s
	0TPsMAoqrwSaOMC15V7WvDAliuEnf6lYdnSOR5kVBmzyhOTCoEIKxl88qQl/H1eeAS/5yt46tdv
	rZGAFpp6UDzEW9hzl29RwtrIUzIbzlcvm3AK567+rmfMZB7oRBlrJzl6uL4jXEGpGKYV4X1lswt
	qAeC2sKbg7VNRGY7fpCqtaGL67hFBV/01JQ+lPkDz0hmHkCYARVABK6A+hR5N6J5GGnDSFExkdb
	LMRVQO4ZWXYpsjLT3cfaodpfuFvh0C/cA1iRU=
X-Received: by 2002:a05:6122:6286:b0:5e9:5e79:ab3 with SMTP id 71dfb90a1353d-5ee8af6ff11mr10400385e0c.21.1795625476403;
        Wed, 25 Nov 2026 08:51:16 -0800 (PST)
X-Received: by 2002:a05:6122:6286:b0:5e9:5e79:ab3 with SMTP id 71dfb90a1353d-5ee8af6ff11mr10400349e0c.21.1795625475813;
        Wed, 25 Nov 2026 08:51:15 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ae4e:e70c:bc04:68c3? ([2a05:6e02:1041:c10:ae4e:e70c:bc04:68c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm517242145e9.15.2026.11.25.08.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:51:15 -0800 (PST)
Message-ID: <1732de8a-6a55-492c-8b26-dd81f3f4dbe5@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:51:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] clocksource/timer-riscv: use
 riscv_has_extension_likely
To: Jisheng Zhang <jszhang@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261107134952.17873-1-jszhang@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261107134952.17873-1-jszhang@kernel.org>
X-Proofpoint-ORIG-GUID: RMi0wIYN1jlD-R_xYHg7yz-Wr57z2N-C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2NyBTYWx0ZWRfX41wwx296LIvQ
 mMK2wfEZMf0bZxqFhJDu5GwbVU9CuclF+iRq6aBjzt5Asgf1NCZPOKYvtcevflgFbj54A7bhHC+
 FdcE0FNm8gWNzvLVmLN1wLm+rK+JTJc=
X-Proofpoint-GUID: RMi0wIYN1jlD-R_xYHg7yz-Wr57z2N-C
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b071205 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=inWZCpT9pWDABBVAoXcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2NyBTYWx0ZWRfX/BPsqGDWmurX
 yNVHFPjMBii96BOPwl0979mV6xJxDYhb+7npiRnFuCaJ5349m36fTX+sJF/W0cn6eLbMT0LulM7
 izHO9lNE3VpKOcmLWDRPmZAeHn6og9sCfS/ORXbxA3O/+Rq60z3MMGwevgmzm1ff4EA+N4S7r4D
 U/EW5dx0OTJjeySAM2CbDUuzYHY7hL23bDj8fQ3jV6uPcptDbojN4/N6UxpNahTIKY9ouB9sPXb
 GPMoqtGVcI47/6DIa2hJc4dqszb9Gsnu9CU+mM7jOaYweev4lnCSTlen1dZ5D6B8QL87g6Cv1DH
 oBkWIylsqYGwRmq7eXVsAFvcSnI7//9UFYybqKu9nXwidElm84nyR3Tu9p5zeTWIQtXf7wIcbmf
 85CwPVjnCfr6o32Vs1jhC91QdmPZtk6Bk0Ro7yYbw3GwBPcIlfxD+hZ4RtVilexO4LHIkfoMfks
 XvYxZsheeJYMHiURyYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_085119_162676_2A5B2321 
X-CRM114-Status: GOOD (  10.96  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/7/26 14:49, Jisheng Zhang wrote:
> Instead of static branch, use riscv_has_extension_likely() to check
> whether SSTC is supported or not. For one thing, this is straight
> forward, no need to add and enable/disable a static branch during
> probe; For another, riscv_has_extension_likely() is based on
> alternative mechanism, it avoid some downsides of static branch, for
> example static branch's metadata in the __jump_table section, which is
> not discarded after ISA extensions are finalized, wastes some space.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Still waiting for maintainers' blessing ...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
