Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CC5606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NuklaeVw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ftnJhnp5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPd8rtLG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jdjwmzcrTrlGIHPozj32cgBM4aceD5a1pkx+z9AXhRc=; b=NuklaeVwrkYRj3buNY13HY+Fas
	xhfJwdS82wiBCKxp1cKDnx6uK1KUPc/pKxbgykfCioxpVubR1eeQzuNJNkiFzHm4d2xkAEza7sHQU
	USxCo19cTyykwbXXXE+PPww8PJ8HOKUiVhg/uDr6tnqqLuuGdQYyhOkdKV+E6ft+pgbwZdqRUSDaO
	0lj0lA7pSNh0QHci/qO+icJmmKfL7DvoR30zEqAIslQszB6OPuRSeJgTfohZRDj/+PMb9XGxedW8i
	Q6CiDq1F6ANfcwSs/AgJ87OQ9Ur1RNfEG/9KmmFTia7541xziJ9ayvV7EkpV1z+rOhlS0PR1iuUXk
	6/dPfoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPdK-00000000r5n-03eb;
	Mon, 09 Nov 2026 13:42:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPdH-00000000r5R-3E60
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 13:42:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEwBG309705
	for <linux-riscv@lists.infradead.org>; Mon, 9 Nov 2026 13:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSrAy5rmEDU2pXsh6r86g+NaMo527LXaCQJIKoQAQLY=; b=ftnJhnp5+M5McECc
	Y13GHCw+lPg86mSX5CztsUTJiDLJm1FiNOpa6f8fRmvp/RXBeFKx8dzV7dApWdDJ
	duQdQ8ayBFSsR8QIqO0+l07KMxofj5jywvpC9z6LvlOWxY4G/lTsDYQtHbDFr/td
	KsoInf2vLZEm6/spFuChnLNGXpYnusWPdlh7V1KXIsKm72Ktw50FfFoQ/2QdCTBp
	b3q/pdGr2FB7XWDZiQ7YrCWwU6yDBgBY5ZsTN24A0QH7qZIHwK4ZF3+y0FWal1kx
	6nrcW0d7LCZXON+XBDyL3/y16DcbRsJGPJ1J8lJXUs4vhPmOqAiZYFjpGkUlzvlJ
	AsjL9Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucap8mky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 13:41:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc3a482af7so797403137.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 05:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231718; x=1794836518; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FSrAy5rmEDU2pXsh6r86g+NaMo527LXaCQJIKoQAQLY=;
        b=JPd8rtLGE2k1fUg1jng9IDfi7v5FEi3KvXhpxmOo705aywR8nN6jkV7QtkHVCaM9oE
         5YpvYD8RaFyTMRhYgyPq4or0FyyNbDsVEglR1U74jHaKSi4HljvW0v9sROCjKqm77ANn
         su6zzDJw+NVfJ94dpFji1GYN7tHlRjR2ScOk49fXa1gdY0xnEbsfqyHgCXS2xBU07Pmz
         0cCQrumZ0+E1B/SM+UzRpvQD/qOPUVRz7CqM2PRth3to+VnvepRIojoxCWUKgx08ZYEO
         pDblSHxTsEkYyWdcCeJglVvqvmfjMFOGvu/EokH3xNhsO8CrU9EW/qpDwYLkMMjys+uN
         p40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231718; x=1794836518;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSrAy5rmEDU2pXsh6r86g+NaMo527LXaCQJIKoQAQLY=;
        b=s6g470zRXTgrVJQ4UVS88wp0DCaXNd2EwWrM83dVKnF236Rf+YqJlM0gshzi4vNf3/
         ZZhSciK9H4M7GMZC4NMNgu1BpqpYImUyzNcVTLmzukPV5/H3SdPPgEDtsYBMbamlS9qu
         f/71PoRhCgraRKkss5l+RVsDnomb+6GqLQD9bRj+8qDKRZJKda6EWI15jDdkPZ3f0mH7
         FyoGxR4VSFHYQsk7pbHpLMqOv1/MEC8M0wbdfgGPjpWZ9YcDQj+HR1es19Gp5GKm0SHr
         fNroTgO+AoIJPXJEIO/wm5JzttK4OrgKux0BtG8qNokgjYTy2EQxfCMYkC+xdIc8VD1Q
         maig==
X-Gm-Message-State: APuU4Z8/LIVsaJQXzOH0CAWI0Q538gTyFs7xPssM4X2F/1LDpkzrXX7E
	WRVgVRYZEaVOOoG09aSnHoz7k9dmsdvnEVsqpKFmwNhZXhzBPUuMFct93mPtMtI8y7vj1dlmKWN
	f5qJW7VrgDfXsp5UdpxbiG6O5Vwq4AUuJbPjS62WDBegT9DBhQiSb1xs4tVn2sm37vKWAAz2VDS
	Ehxv4=
X-Gm-Gg: AYBFou0qQA4nXo9NRv1XFiU/sV0Jf5enHVpEjXnsQOrAU1VVHwnmABZqGUcOVxZyxio
	uxTfWctg6fgbkOB/EHkeTa12SfGws75WiiIfg5+XBgcZOszBLmCX7/uKqopcUJqUAFFCc7kKVBP
	4ICW4gYYxG8Td7Bd+eei2nJQk5Qe8+fwpXI/hfu/YVU28LNi7YiHyK/HKy8Ka9TTo+7j+KQgXi7
	xTeqaRTli4AvS+PDs9tEbSseJUGgW8AXSdNkJIYpwsXiLUhqmYofvQsA7HmkDOxws0qGfO1/xzY
	nBC9UZPA+QICIHWM0X4wu7j6/AQhRo/R9CWEvBXa9x81h97oZ4fM7jc4DTt2Lui0OdZOiP5oTSF
	YehxG7eRBZ8+ZUTt5PPm7ii6Eusv2ZbvBaD8FyW1jLM/kLho84AfzLU6NlgbKZ9ZJUy6Rf3PESa
	CnZOdI+YJ0/eE=
X-Received: by 2002:a05:6102:292b:b0:7c1:9286:296f with SMTP id ada2fe7eead31-7d2db17accamr1198271137.25.1794231718002;
        Mon, 09 Nov 2026 05:41:58 -0800 (PST)
X-Received: by 2002:a05:6102:292b:b0:7c1:9286:296f with SMTP id ada2fe7eead31-7d2db17accamr1198261137.25.1794231717527;
        Mon, 09 Nov 2026 05:41:57 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee247e9sm149396925e9.6.2026.11.09.05.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:41:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 09 Nov 2026 14:41:55 +0100
Message-Id: <DMQQ2772H45H.16UW0C0P9NCTN@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] riscv: hwprobe: Report Supm only when available
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Paul
 Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Andy Chiu" <andybnac@gmail.com>, "Zong Li"
 <zong.li@sifive.com>,
        "Charlie Jenkins" <thecharlesjenkins@gmail.com>
To: "Guodong Xu" <guodong.xu@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
 <4879567e977e3f5023c6e7ddca133b1a.guodong.xu@oss.qualcomm.com>
In-Reply-To: <4879567e977e3f5023c6e7ddca133b1a.guodong.xu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfX8FVhJ/2Do4Ow
 6iWekzCVgGcYdLe/F9lqtVfkujWKcJ0wh9rQJ7JlLMQUq0X6L4iYbsNl8nSzz+jgpAduH3jh4bt
 joTKVVGiT0kNHHjJ5Gnybgyq6pxyov657Kxx9eADuAZUBn044GlCECradqws9iKmNEGZBaxXAj9
 8WPasim9HOF9kFKHXkes7ODtapdZmVvzeS11I2rzy56DEcTqYGUwnfkwAaHNUqmgEfLK2YrPqRT
 QqYh/Nzdm5VHXYzmva5AegxRhZdUNAUPT2cjiU7BnnV72YXpeSYbGEAxiNgfMoueE+aptGKlCuJ
 z7b4NR6p/liXmc19Lnb7lqAYNFCX4nWS8nSapOH+KIFKuF5Z1IxhTaQ2+N34G4xqEJx7Rhk0hmT
 m/7hSXInvmij9CnI61MAyzvwmRrJtJA4mdloDHZSXGfA91djhBqJoBbY/ebotyfTpI2E1/oHQRX
 lMeEOcmD1Y8i99IGgvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfX+kDYtOE3veRJ
 b4eBeVQeV50jmThNhmL1B6Fgi7fVY5qRAlpagrUJEmLDUpKWYKdf3wfaroK0w9mmCJW8tZPW/MN
 V6ZFVzv9RWpq1wiephP6ZIrhbGiNHMo=
X-Proofpoint-ORIG-GUID: tKE0LTCF0Zl6vUStBUJSBgK3eKq7lvpe
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af1cda7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TnNrh61NuvM_ujTk5a8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: tKE0LTCF0Zl6vUStBUJSBgK3eKq7lvpe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_054159_811079_DDAC494B 
X-CRM114-Status: GOOD (  17.28  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

2026-11-08T06:24:53-05:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
> Hi Radim,
>
> On Tue, 6 Oct 2026 09:53:01 +0200, Radim Krcmar wrote:
>> The RISC-V ISA defines Supm as
>>
>>   "An extension that indicates that there is pointer-masking support
>>   available in user mode, with some facility provided in the application
>>   execution environment to control pointer masking."
>>
>> Our facility always returns -EINVAL unless Supm support is configured,
>> the pointer masking ISA extension is globally present, and the user-mode
>> is running in 64-bit mode.
>>
>> Hiding Supm in compat tasks would add complexity that doesn't seem
>> justified as 32-bit code has no reason to look at Supm anyway.
>> Reporting based on the a global sysctl toggle isn't done.
>>
>> Do not report Supm when some harts lack the extension, because it's not
>> available on any hart in that case.
>>
>> (Reporting Supm when only PMLEN=0 is supported isn't great, but doesn't
>>  violate the text of the extension and we ought to have Supm7 and Supm16
>>  extensions if we care about precision.)
>
> Since the kernel already knows whether that is the case, could this
> block use riscv_have_user_pmlen() instead (55458c7347a3 "riscv: Add a
> getter for user PMLEN support")? It exposes the have_user_pmlen_* flags
> that set_tagged_addr_ctrl() consults, so hwprobe would report Supm only
> when the prctl can actually enable a non-zero PMLEN:
>
> 	/* PMM=0 is "disabled"; Supm is usable only with a non-zero PMLEN. */
> 	if (riscv_have_user_pmlen(7) || riscv_have_user_pmlen(16))
> 		pair->value |= RISCV_HWPROBE_EXT_SUPM;

I'll use that in v2, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
