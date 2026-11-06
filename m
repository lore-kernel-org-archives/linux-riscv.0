Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3D2606A33B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mK/2neVo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Djh+AL/+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h2QMJpNB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cpizQ1G09GAdrE0AqyEzWvrm+tCbW5QeopiB55NPGBw=; b=mK/2neVojnujFW1X+3tY2GCAN8
	KQHPq4idT1SWxvCniggGY+ZWc/i88lF2hfwOxXiXg3ler/TrI6Vvpvix2vS4fGqWV9bJ1ue63IK1E
	99VHm5GfRKv7J+eV6Lv+GohMcIwiGGP7MINoDB3TU4RVtdu2L9Fnl+KFCZpASVdWfAkDyYoI3QQvq
	IEtJH6Z0lvfKRR80elIM6/YiGZYRQ4oIKATv5DAtDX4587WCTv1/CIIQIkI98G1xtSYDEBKGI9n/k
	o48vKzLzVNRuBW0Fu59uiRXCHUfSSkSG8mM1TtPV3ayMT7qotQNJops/vho8aPMYwJYrhbEvPVMN8
	to/FeI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGTw-0000000BnAq-01vb;
	Fri, 06 Nov 2026 09:43:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGTt-0000000BnA5-1kps
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:43:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R2FR128919
	for <linux-riscv@lists.infradead.org>; Fri, 6 Nov 2026 09:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZXYuUJlq0DIs/ZhnbnzwAKYCaaO0O+UtNup8mIm1co=; b=Djh+AL/+2B4ZApp5
	yOwfqn6TlwAScj+d/ugY0FXMbUgR5g1+1rMHR6RvMAOf+hJ+Pttm/UrErNDHFHDR
	qOtM8Wz7A3XlGzghzTJzQMqdWfDHxkwp1WDVthuV7/Ff75La540KRE0FciQU3lfZ
	sTZT5grtLChD1vzby7iSkYInHjgOzAtG5NBGUR+C8DXmcTHDy/nVbLUhgF//OwnZ
	DXl4YjsCjlQKErrNql4OQs28tb3jGUiWLi+LQPxREIGjHMPr/0rS7CeWlJwyRHnk
	JpHcanVHutOof1g8hfUqKFfehC87yP2NNbKrc+dH/ObaL86I0deabSRSmD/jeG5U
	NC1P+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9t6a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 09:43:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945b0154705so72398085a.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 01:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793958211; x=1794563011; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fZXYuUJlq0DIs/ZhnbnzwAKYCaaO0O+UtNup8mIm1co=;
        b=h2QMJpNB9GZS5nfcmVaPKdQP9ac3BEnFRnsFybwGm8eDvpH3GmC1l3nWw8Mqu7VcKp
         zrbsLoCsDMAlXuWvLJTABgVSVOBPiN6tmXX9cJioAV0tGiSpOjjeBiRH9r5A9UDFk60l
         /tywPkjz2upoIEZ3JLjgq0DTlyUjlcqsxMq2jZrvivucNKVY8gzvcALKIl/3/3y3y2Z9
         cDP42VcfE1VzpwTcvw85ffbX0DsrYH2YN87H2LVmYVgUx3rEWfPhfx8psLiWfqZWc0nC
         x77D9C8FDNSYxtvcWkig2Le01dpY08Pbm3gtfUmp5OaOl8ZOGdQZiMlAd/t8sJV2p3Ub
         KXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958211; x=1794563011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZXYuUJlq0DIs/ZhnbnzwAKYCaaO0O+UtNup8mIm1co=;
        b=Wdj71b2rQieUCEXetHgO1QWWKPuc3SbSM35s0An231jwzyAH6hfOasuJ/ciHvJlLG3
         QLMQ1KLgYMFLvC6wNTxSE/Baiv6RPXax56EZDCALWwdYBXpsEdVCXbhv84bXjxpuAdmO
         WqUTIhmmGPeudS/Zh9TbwZvo3iXroOm6ra6BX+bX8uZKW0Gp2ReRVl03K/B1NzWV4PWm
         Rptqd2y18D40VkvNuFrJ9SaIDKlZrCthIzAvPusDDTV/Ic8CP9YC3UB6ey1rOK1rtMJB
         v1YO2f2HfdXL9tnpIL23rRSlIaY2f10jKyZ/L4jmotNo6nQ+/FMYmnXwd+kmtFyp+tmz
         m/JA==
X-Forwarded-Encrypted: i=1; AKwUvByRjglAESRl5XPn/hnQFVEOrVP2D0CqZdhrFWiP9H3gtJcRrIsUtnNQlvLvmQo/dbujQDONdRjGvISmWQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z82G6uZkRs5JtdB96dwYbcoZxO2QsY1+SYA1Ao8ds6GuTYYywCN
	tm2TWRKPNMgSND/msku7cFbCnqczZliJUYCGRTT64X4z70/oQasV7OHRxq22m/wpvk1WZSYz8F5
	80UKmbtL0KUWV5t7MrPFigNQ9rKxehi0zcxb1CcixgDETBS9VnqP5Y0mxgy5qQoLgTrjWZvTSeL
	MD1/Y=
X-Gm-Gg: AYBFou3/CfZEZQWggii8ovoF/JeEO4J34Ky500QQiroefJHk1hlD31iJ7acDShjQlcz
	B5TmCHheYXZikGZGbOyaDHo4oAR0rxJchDHCWINmAF2AuFwXqMfYjrkknktr9NnzcwKX9S8VYWA
	VUUUMS6o3WRFfBHLIpmPnuF0bcTVIt6ziKUM9znSWFG3ByOHSNlXWzfKCDL03WJJIr0dsJxdAR/
	iiTKVm+taSQWnUMGAfAvZZ4N5B88AksALasC7BXlTCrw1nCWcbg9PRQv35bS0QWXfMEamX0t3cB
	z6QNuMBAd6moTYr53eTSbw6Wz7u/C5e1JpXnvL+ufYKwk9X3+hFqkgjzrArYmLRghetrrz61+gQ
	GXkQ689i6wC4+FHFRYAKw9Fubm8G/P68GTNXsTjsJPHv+rHTi8jbCTsiynflo4Mrk75DQYYxxlI
	Ff
X-Received: by 2002:a05:620a:1794:b0:93e:e1fd:b87f with SMTP id af79cd13be357-945f368b0e7mr244268985a.83.1793958211216;
        Fri, 06 Nov 2026 01:43:31 -0800 (PST)
X-Received: by 2002:a05:620a:1794:b0:93e:e1fd:b87f with SMTP id af79cd13be357-945f368b0e7mr244266685a.83.1793958210720;
        Fri, 06 Nov 2026 01:43:30 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm41299075e9.2.2026.11.06.01.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:43:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Isaac Adjei <code@isaacadjei.me>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] gpio: mpfs: reject unsupported interrupt types
Date: Fri,  6 Nov 2026 10:43:28 +0100
Message-ID: <179395820571.6762.15630695302653081248.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpio-mpfs-irq-type-v1-1-cbb2b0b2a807@isaacadjei.me>
References: <20261105-gpio-mpfs-irq-type-v1-1-cbb2b0b2a807@isaacadjei.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX4MNUryM/XgEK
 KZStdfdBLf0PwuwuC1PygM0+PLoinGzttMGVRGqB18VLQfgeKdtQXYZvwuNtN7jrIkrqxnTgSN3
 eNAokyLqUlY8dwCf3JijSnj/RQYDyjU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX8IOhUgrPsB2g
 LPafzRVU+6pB/IYdpZf6bEqsAWmCmUBib0n17JkyFdpJANAAUp1/3+JqpGDAArInhZ6wRbUkuE8
 uEO7/kbVd8RFemagA/UhS678L0jrvdEiTjhjeVczcUNg6LuuUgpeS7OcKMAXWQAc0EV1AxBpLVT
 CRY+FaZh3v6kFUtwNHlMxjIkyUgDfhjIVqWx6k1X7b/7m++tpWo/5f5JbG+lFuVE9UgzrcLtSdd
 CMi7bI/+mHK3b1HnLi8pesicDX9tbRyPgsaWkUQruQtnFemDsLbhp1p9vnrqvubj5cLYZrwdVno
 E8DqDhKZx3tO1nue5tyFfiRgcNiJtwXmFIPPL3pwlRO1h3JLwomQBbkMDXE3MrKg+7CmSfHSTBR
 umeCicjbbMcsRCyfHWfihEoEoOp8ZbDcBvsniRBN45DCXVsaZk8P5QWrzMgVl28CNfK5YML3auw
 gzmlmXWNMnjkhuxcxCw==
X-Proofpoint-ORIG-GUID: n9AanTH7JmNVHYTGhcbd0Pe4I9FKGz28
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aeda144 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kmRQxf5D32N2tAlX4cYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: n9AanTH7JmNVHYTGhcbd0Pe4I9FKGz28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_014333_462968_368C8048 
X-CRM114-Status: GOOD (  10.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 05 Nov 2026 08:16:51 +0000, Isaac Adjei wrote:
> The switch statement in mpfs_gpio_irq_set_type() does not handle
> unsupported interrupt types. For example, IRQ_TYPE_NONE is not listed.
> 
> When an unsupported type is passed, interrupt_type remains
> uninitialised. Its undefined value is then written to the GPIO control
> register. The function still returns 0, making the caller believe the
> operation succeeded.
> 
> [...]

Applied, thanks!

[1/1] gpio: mpfs: reject unsupported interrupt types
      https://git.kernel.org/brgl/c/cfbd01eddaf5bfdd4f53560013fe830571a186e9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
