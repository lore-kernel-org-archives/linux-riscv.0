Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B503CCD5BAB
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 19:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEE7a7Owd7DbYFO8ixiVhRQO5xzYnWnHn1z2gquxU9M=; b=lwOTn3N1KDT/PE
	FqHUY/z7h3BlcLdV2Q0dxWKQKaseLYw7jcsyzxH96t4o8Vc/tOOYeV3RcqzJA2s+Oo4WEpcS9comP
	097OS3cJs9TKEnS3hdyD3ibs8Q037vYTSKOz8E6wdfHmVicDmcbUjSkSPEz5YbSbk1QqBwbWJLhSN
	CdTdU87mTL8CgdY4TUTe3/v2myJw0YzqXbak+w8AxAROvVbXlS7kgCZU7nAkYQVA52vEXjU4svy1x
	iMLSL0x/7/NBQJhTbXjnNJtzbx0KzTMfjA6OBLWQJrltbZr3MUvDADVLRKFdInR1p/HO7KXwn7f8h
	VeCG8ucmMZCpo4Tu8RnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wREpH-0000000FX08-0xeI;
	Sun, 24 May 2026 19:49:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wREpE-0000000FWzG-3SZp
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 19:49:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OHho3N2305996
	for <linux-riscv@lists.infradead.org>; Sun, 24 May 2026 19:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5MO/OMSAh+ISDr45BR8NwJA
	XuQI8xvKI6XO4ycoTj0=; b=N3Wz0mnpcXw5UIH0b2xrFG3DN3CKQzkY9k2DY9eM
	Qso5dHfjbzeuP7oy1uorTKXI22jUThALjtRfxAcvs4E78L8yVrSRhmjI00oepO7A
	kSq4ANK599NGcpX8yAeN+pG7408cOdP993E8LCBi8GONTLtsVb/yZ34zxuhud+Wq
	Q0iKNxI4377/ah9tNN5qK01bcgPp7GGUCuB2/uI1NHBgOIFy6w9g5WsW+WYlp6r0
	y6wVf+9iB9RYicyHIgZUP9GghqNoI9xiL304LpaJsLIyjC4fCubBmN8IoCK4D6kF
	NlBhuyZLFpZMG2FY3v9KsoVx5cKG48i71tfATu39JOfZiw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb50fut21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 24 May 2026 19:49:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so5210530eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 24 May 2026 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652167; x=1780256967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5MO/OMSAh+ISDr45BR8NwJAXuQI8xvKI6XO4ycoTj0=;
        b=G5Va/VaAKpVLu6flF96pSjCVxD39lHTZgglFOxl4tV6PYxSEON/l5m00gI3q7d8RwE
         qO5mq1MgSUI9MgcWw1N4xzCP+VFXxjNufo38tX78yp4QdTlpwvZyADrFVN9wmpJgj71H
         eEIxK8C+ajdHLGVx+eSOZNBO11lc1j477ThxzqWaj+EdtYY9U6JE6UNqUIOiC43MqlH/
         CfgU57i2/YELwhJ4ugrjz4va6fxUpOFAv/03BhC29nhH42R81PG//hvcNUdMp+Mj1ArJ
         qZU1JqWWaw2ufxXsDHQMQj44fopRp4TdjTwuIammMuP62ZpqShYXiJZPWd8/SBuiMdCD
         BKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652167; x=1780256967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5MO/OMSAh+ISDr45BR8NwJAXuQI8xvKI6XO4ycoTj0=;
        b=bpBRGkcm6MFTbCHDirtWueDp0wyQTvPi5pq2ehBuoDksUxYqaZt7r2Fq3TgksjySZ/
         n0yaArwe0bgwG0nkfLoZG6k/G3+Xhv7TifQZLfLvN9P3MomA/HDbIghRm7JdROqEfoq9
         6HEncgJGDSiA3fEMWyHbF82b9WZOGfTz90ydmIWiNgWodzXW/TOT38YoD1RO50Of+y3L
         3izzO9ydcAQ0XPy86Cb+ZvvHdlrusK7bwzPAWjRirPx81zDvSV1k6PR+6CfMltcLv53c
         qM8wcNjZwAtBtBG7ZxABbSydkwos30qA/o8OftNj4172zzMvqGfdKfe/mi5SuR7ML214
         LIiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xBt+p6N/aitGgd53LwnKMAYLMZf0LAsWmEkL6YLjxb54siFS3W+SQp3hRs6yHjClOuHUtO28LLTUyqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzMRgzPoTTjwkseoCrX+Fee+siaQtcJ09/2PvtHnvTX6NfD8GB
	HZ1kAFmXQOJnGBJPzc/Q3c8RNDMOfw41HDux0D16MEe0nT0dCykjbJCtq5JIdVoCMWY2jWnzPBP
	Ktj9hcdM48hS2ZsH92Ra222VciZeaAZBNGGeQmAEVkrfAiZtDn77wYo+HdVH+gEdJas9Flk0jNW
	PlJDg=
X-Gm-Gg: Acq92OHAoXF/wn4rN3vFMDRyZ5qiv/HBHc6SzAu5mH9Cwpj9AuEHBclTxPDEggqYe2R
	FH2plDZBIqXkqCvVOnefXBOAIDSaAwyibmT9lI70lJcxMQZo5uFnQcztiltsMzHz/aoIXiPmU00
	0JdJ8x9NbyQJKlwWyCA2DBiN0ALUDOk+jqkYhCUKDwLD0NHRqUK33LVexdHJ07y0TS/+QAPyZkI
	VmNBszFUp8NZj2yx8zuZu8cdaYa8hiFMRJmwYhJSrMge95Uvf7RrVU9C1HhQnMqqcebL7/NL4Fc
	eZsuhMgsG3MXd9OgsU3m58Z1zp68T1oQ5mv87/FsJz9CWovBmXIw1+xIMrz995LRpKMY4C06/A9
	Jg5TMPr4O2e/7Affu6b6huZ0hr0vGsUc=
X-Received: by 2002:a05:7300:72cd:b0:2e7:190:41d6 with SMTP id 5a478bee46e88-3044a3f996amr5218047eec.2.1779652166998;
        Sun, 24 May 2026 12:49:26 -0700 (PDT)
X-Received: by 2002:a05:7300:72cd:b0:2e7:190:41d6 with SMTP id 5a478bee46e88-3044a3f996amr5218032eec.2.1779652166440;
        Sun, 24 May 2026 12:49:26 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef470dsm6221072eec.4.2026.05.24.12.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:26 -0700 (PDT)
Date: Sun, 24 May 2026 14:49:24 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: ajones@ventanamicro.com, alex@ghiti.fr, anup@brainfault.org,
        aou@eecs.berkeley.edu, atish.patra@linux.dev, jiakaiPeanut@gmail.com,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pjw@kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Fix TOCTOU race in SBI system suspend
 handler
Message-ID: <y5hmqjrtgeby3amnlfycifpfm2dc3oaj5eebgvdu3tgjjgohvx@kw3a7xpxqrbt>
References: <rqpv3mrcsxxdlaedbckb26bf5vfkj3xgd6m26me24nf4tbcqtb@jh62r2df3ur7>
 <20260523013232.2352161-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260523013232.2352161-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfXy5UGv6HbuudN
 QJaA7LYpxIPvs26igjRg68Dlc0vGop2dWlX7/RrfOBnILwG67Dzx3LvJ2RzKHu/xEN8bp9peZpE
 QxBjikKFHbLtjgRFRrnyCrs2+NjSZ84Osu9tUg61svBTsjV22LlRwdjaDvciaFOg52BGI92yPwx
 O1xPCidATGsxnYQDx5/1wcihyufyeOqMpKwtkwo1Rx+DQx+FmTInZ4QQhQD4CBdHm+jF2EGRVmX
 Spd8iT4hye43V2FI8oYFCwdS9KGlzYCPjpBXxYTX2PWmJTMVDA+XPQQhEImtwNBmyFXN/QmQXU+
 hxBmh3/zFxWcz8Le1wlKpbWKMkcCE9R7nkV1Rd+pyX4xvuNJHfPN/4uAs5KbTo/R0tP82jFyizo
 MXRP4ctx7QitHWiEulpbyRR66+V7FCMwoykO7lFhguOoi1XqDejXb0eKQzwLvhtgDmEyUWhcKhd
 m6GKe2nNd3esNIWR6nQ==
X-Proofpoint-ORIG-GUID: 6d2NECtEsvL_AM1G2XmO3mzWGe3morwD
X-Authority-Analysis: v=2.4 cv=UdBhjqSN c=1 sm=1 tr=0 ts=6a135647 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=fKUkpt_rHN1RTTC0GtAA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 6d2NECtEsvL_AM1G2XmO3mzWGe3morwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_124928_875150_03F617BC 
X-CRM114-Status: GOOD (  20.21  )
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

On Sat, May 23, 2026 at 01:32:32AM +0000, Jiakai Xu wrote:
> > But... before we get too carried away. Unless I'm missing something, this
> > race really looks too theoretical to justify any change at all. Do you
> > have a test case in mind that could force it?
> 
> Unfortunately, I don't have a reproducer or test case that can reliably
> trigger this race. 
> 
> But as we saw earlier, this is a real bug, and we can tell that just by 
> analyzing the code.
> 
> The real environment is complex and unpredictable, and such races are 
> possible. Wouldn't it be nice if we found it and fixed it now?
>

I assume the scenario we're trying to fix is:

 HART-x                                                 HART-z
 ------                                                 ------
 SUSP()
   Check HART-y is stopped
                                                        HART_START(HART-y)
                                                        HART_STOP()
   Check HART-z is stopped
   Determine all HARTs are stopped and exit to userspace

Besides the fact that the race seems quite unlikely (only a pathological
guest would try to force it), userspace can/should still double check that
all HARTs are stopped before proceeding with its system suspend
implementation. So, since we would need to introduce a new lock to resolve
this very unlikely issue, then I'm not 100% convinced we should. I would
be more willing to fix it if I thought the host was at any risk, but I
think this is "only" a guest corruption issue. If the guest does wild
things like this during a system suspend, then it can keep all its pieces.
I would agree that we should add a comment about this choice, though.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
