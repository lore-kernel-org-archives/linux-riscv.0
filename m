Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577EEE7DEFE
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYhha4Z4c7ptaK73n8yxDIC30VmY6u+O0qAE2Bbv+CI=; b=Jz3KwnxfvOGL7g
	KqrmgIHrfxl5orrMFf1Zvuz8vxQhXCITWsA8p5TOHmrlWDZjD7zcssqaxUsOmRH5WxFJZ+HRDx/gQ
	pPxrMErwpqo2Zb3qnzSMGLB+91NykIf5bUK9aEGSz+AZV7qUj6Ip1oCetSKXXlFer5JLTOduuV4fK
	4zMlvXnQVsY0fmKbHzXn7ENB7bV0cMJmSMN0FeBKbLByriNyjfMGVYUyNIc+PQJvIGs09wSNu102v
	6DDLYRNlq66LMWTzh5z9PWZlXPrn1bM0lbLam6SLE/SlbbTwQaHhhwWZOuj351PNZ9iqrPfiXlgQv
	hVAoBW0f2kpmVb5iCYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwpx-00000005IXc-2CKu;
	Mon, 02 Feb 2026 16:31:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwpu-00000005IWt-3sPV
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Feb 2026 16:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eTpxpJLfJ8cj2Yer+m230biy2Ugzgu3eLhQ6MAn7/Yg=; b=HRWQp+qIJaHyYXlQoBi9neeQL8
	WUISFg78rnRpo2HVSIycPA0lkCyO78Qur8dsukPXm781RA/oKpIl5hXXK9NNrJcuePzDmq8a4ZCkD
	w5ka8caCgXI9ZcqqM+WEUs5tmuTEXwxDBky0AS4GyTz2iXHPcqwxSss4fevGUiB1aqN9dGshUehP0
	tuFNpxunT6DiJNyi9laCmR19xqqIJ2VGppRYkCB2t8/Fny9fTV81cl+YrGmv2FrJvoty3UGq9q7Fl
	BuAtwaL0tQDBRV4qfjC7kIyJ9Hq4Qwtn9EJbO3VpbtuXmsl0WPHxOYrXNPEDg2s2sZ/ZvFiBv3wS6
	9NDmd5Ew==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwpr-0000000EqYn-38T9
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 16:31:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612BAQet3082911
	for <linux-riscv@lists.infradead.org>; Mon, 2 Feb 2026 16:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eTpxpJLfJ8cj2Yer+m230biy
	2Ugzgu3eLhQ6MAn7/Yg=; b=H0aD1TdxU3ROBS+Dk3n49fvNaVNdzl1HXpx32sgB
	17Iu02FVFeS4Y2dAWxrBxUAHl+txY6kJBe5J34T6Nv9MDG1vQgq81sN+VfbtK7Xl
	1LMhRrniXNA1FLoK4apBSVgk6vI8t6q2pnMpXKInbjnnFgDx/l1ycEXVUkGWosYc
	S/8IKdhJpeCPe/ih3kVoCdpXYh6vrk3rKCCmURY+o6hDqaQoVVGmT7zcXV++yxSt
	eg/L6K+tzkdaeZljm0t/R/3MGIT8jiA2dCAJayuorPkWzuCEAKr34CcwFqm1/QCL
	WIaEpwtnQNgMulownNMgayZCMl6dKUsoBYkz8GCDNgAwIw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2ttn0x6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 16:31:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b715b26fc3so6311449eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 08:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770049892; x=1770654692; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eTpxpJLfJ8cj2Yer+m230biy2Ugzgu3eLhQ6MAn7/Yg=;
        b=fQTmBP0B6pPsq+AdHP9n8RsnKeUXrXQ+hFAmvQmpepKWcfZQSbYyJN0ek9q0cDb9el
         L5wdVMdaKN9EPnL+Shyw5gdteUuCf612M2iC86vvWlB7Q26jH4fBlZoy9NkJvz6nGrZ4
         kzurDYzeyCUAGgzatxDApInQmhldiOydFJ6UyVGn8juQGKBjIIcBp036TWHXja2rHyrk
         XNN2kDiQzRB27hZEZoFwH5S8+89AWWSecLeofhQqyVtic6L5/SASn4S0R14M8zh7iYDr
         ggVJjp57IfNFiSQQSJEaBCScEwF43ThQyDezEf5VDdbxA3QR1B2R9IvXG45JBn64rNbU
         JA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049892; x=1770654692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTpxpJLfJ8cj2Yer+m230biy2Ugzgu3eLhQ6MAn7/Yg=;
        b=vyBm+T56H7GXWL6z1lQbnQ8fwJzL6vfOoBuQvByAgg0UK3JvK1HjUzeAB11DVfvT+B
         LhwpBAX5ozPnKuJuyR7lFSA0GS+x5y1M5WRhQyT2DokE/xg7xw4otI349j3TGRB2sRda
         hU7eEiMb1DAGFamBxmqXI4ggVYwXxJlIisMb6o/1SRXSLEP95zQYya5Hh1Fa64zjw4Ah
         /KCUvG/r1LS2l+UxnB2vpbIM2UeVc4t+VnlaAbuNaViYq3Mc8H2YsMmye63oHtwMCMPU
         SOfzCc+nVaQ9gR1t1lGzHprTG0RgFYERPjjisY7P39et7L6QQ0mQARYH7EUycg3RDRY4
         9Zaw==
X-Forwarded-Encrypted: i=1; AJvYcCX5NMn+uaY1am3IJpquZK6u6IzZt9AQdqZ4wYd49SHiuWLK/jbkKJSobbN1UUEn8CZOuQg8D9ies2ZlBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YywrqGDehbMXXGK0ydCP/g3hReM7EZ1nZaoJQuvdN4DIoXzq9JX
	mR1fOmSbJeu//IT4efkkvcmkCVXYguwpelKZNy51Tg9PXGgywXTQXLYrFWlk3AguK9TU2OTufyJ
	thTLFz/nK9NBAbBZXEESYhZBqu2QHF+IUECChN09d/gjBJqqJdna19g8YpMFjA1xeKYicL6c=
X-Gm-Gg: AZuq6aLP3SAndfSwY3S8ll5ifc6OKmHTX48jIuLJM6IibXaH+Fqhw1ylTQbzJMaJRkH
	SSXFDwyGs9HsyI/fNqbrrY5y/PO53DUBUWFQZeP5mdoeJpPyTwzbiwMogLpUd0MJUkf1g3qsLq1
	FG8xYMdDxleYgBexcPvn0fISViD0hM4qhHrlHwQU8/B22gAqyDmqgpdIoA06WzUrWGvpuWuHDUC
	ohlFUMGzbsI1jtL4bOB8ygtU4DjnEHTPChAFc2xfTIl/ZVTZ7NiBkmXys9EwKrgr8wGr1S0z61d
	wFTgMbmT4Tzj5FuGcw4QHZt2xOkh6EMOW2cTXU27ldE5FWv22NRvqw6PvRj7ESBphN2xNHYe7tu
	haRwrjPfmWgLJjSC07vo=
X-Received: by 2002:a05:7022:2481:b0:119:e56b:98a7 with SMTP id a92af1059eb24-125c0f95953mr6050904c88.14.1770049892247;
        Mon, 02 Feb 2026 08:31:32 -0800 (PST)
X-Received: by 2002:a05:7022:2481:b0:119:e56b:98a7 with SMTP id a92af1059eb24-125c0f95953mr6050882c88.14.1770049891645;
        Mon, 02 Feb 2026 08:31:31 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f789sm17569743c88.6.2026.02.02.08.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:31:31 -0800 (PST)
Date: Mon, 2 Feb 2026 10:31:29 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        Andrew Jones <ajones@ventanamicro.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v5] RISC-V: KVM: Validate SBI STA shmem alignment in
 kvm_sbi_ext_sta_set_reg()
Message-ID: <h5ywmsqp2eysyslvh7zmuiw3mzthkiilgqv4gvjvpl6nejxs7m@ahjmnsz2c2x3>
References: <20260202003857.1694378-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202003857.1694378-1-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=ANnNY0ku c=1 sm=1 tr=0 ts=6980d165 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sM2csZlYJ7vdm-W6c3UA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEzMCBTYWx0ZWRfX0rGYtcDLytM4
 jyJMhiFeQpLFqALe2DomjcpT2KAYic26xvrOKuQxGo8WI0s0CWMZ3UK2MpmVoAxeCvKjSzcWFDF
 +Ieqaog17+PnamO0OdNAPmOAuv4mDfNdkBPhIddZDMuLU2dhxOchbPZY4ERuZaM+3ixnGjWbUEN
 sNdmhywx9vX9JJK3OqDHP+bI4j+nIBMBtYqCR+3tOltrBbPjLSxmHsn74pqDPLRNgndLs3oxGEs
 eT6lEXP4ddOMJOLUNIOkGp5y2L1KCB9ZsOJ0Bsyj7drC1uo+2wYFNKgjsO9DkrFjnc1noUzWgSO
 ri22MjtysexA5Y9Idzn0qcy3GWSWes3N9KBsk1d7b9hw2IU8Q4YUphOhdTje9/qTVAeCLP+VrYw
 UGp93LeYiOJxhbxSkORWU3D7+FKxip+Tpi2nS58KC89dI+PDqgO0HPuwW2R7zkerVqvKzeqs533
 jm25Vtbiu2dZb7U5dig==
X-Proofpoint-GUID: c5AZBiGJvRp_vrC5tndI18xnxepL-42U
X-Proofpoint-ORIG-GUID: c5AZBiGJvRp_vrC5tndI18xnxepL-42U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_163136_232612_3E30AEAE 
X-CRM114-Status: GOOD (  13.25  )
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

On Mon, Feb 02, 2026 at 12:38:57AM +0000, Jiakai Xu wrote:
...
> V4 -> V5: Added parentheses to function name in subject.
> V3 -> V4: Declared new_shmem at the top of kvm_sbi_ext_sta_set_reg().
>           Initialized new_shmem to 0 instead of vcpu->arch.sta.shmem.
>           Added blank lines per review feedback.
> V2 -> V3: Added parentheses to function name in subject.
> V1 -> V2: Added Fixes tag.
>

A procedure comment is that you don't need to send a new revision for each
change as comments come in or as you think of them yourself. You should
leave a revision on the list long enough to collect comments from multiple
reviewers (including yourself) and then send a new revision with all the
changes at once. A couple of days between revisions is a minimum. For more
than a single patch (i.e. some longer series) a week would be a minimum.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
