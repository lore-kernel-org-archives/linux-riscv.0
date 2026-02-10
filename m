Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0E3EA8126
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Feb 2026 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HCjIwzK/GLSkzZhxkcmZQp570gcY019yA+DNzw64uY=; b=FffB7qSvI71E6P
	gsOorZc7IyG4Wz0vcl/nqINvKwXE3q6GuLwUuMP8qDObKGZ64wIC0G+FIcSf49t3LoIuhgpAJxA3D
	SINCjdFGS2/212cXzPmn3JrC0xNRlZ6N/FUJgbJkQ2SfTzMyezPc4QB51WylE+lkl1sUP2eBRrDQa
	Dbuljof5/5x6jY2olRZA0nq+JSKEEZXdwA1d3FpZuIjGD9/IbchcBvniA4SzJYsrmA2k3Vh+dag8C
	yMw36bymhyrZ4+aw+8d9FT6qxkHE06l/HuE5oQrQ23gFpIGifvkCF7dqe7DEBgqR79vNyNcuq69db
	dkBAMb9MVmaIIx210PNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppRM-0000000H74h-1rri;
	Tue, 10 Feb 2026 15:14:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppRJ-0000000H74N-3snu
	for linux-riscv@lists.infradead.org;
	Tue, 10 Feb 2026 15:14:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ACD4XO2323175
	for <linux-riscv@lists.infradead.org>; Tue, 10 Feb 2026 15:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J/AjyONAcOKw9fyP71DvmCeZ
	OABxEcpsqNv9Hd6xYDg=; b=NX1VcfCdUZ6k023yTa5nrcUU8+rXqC4qmvc3V+wN
	IvsFXBnkF1DKmJPleq0rG0PC8nNyA3XJ8sYwgGRfSpVd3fNM2htCsX+ujwJhuCAG
	B/1VWlGTHZPq0aLQkoq7zmRM+/3+tl3ZpO6oN1dXvNcnROVbaP3VZebAc4mv1rQo
	HPOdbsPzzMbEveD1CR0Q0MAf5nQGtQNG266CUE6o+DqXMI9X004HzRFVfWw/uDgB
	XCzk42+eQgaeN5EhDnRQI0ucbZqT/i4jmiJDgTsdUCVCQjJZK0/FcyPO2pfRDA7T
	5Ug9Hm7fQBcbRbBg8AJBdcp/QYqygAr0iYCa1TWtTV/a0g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c84g2ghaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 10 Feb 2026 15:14:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba73b692b8so613029eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Feb 2026 07:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770736447; x=1771341247; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J/AjyONAcOKw9fyP71DvmCeZOABxEcpsqNv9Hd6xYDg=;
        b=OZLsjq/nijMViHw7YeGyGQOkMUP9zErRj/iM1IdJ+zj2PJZsdYDUh7nM4OI56s3vH9
         0Q6B2m2choKWcyI+CSZbxdu6lSrQ+pd/zdR5n8coLNitwEbtE9GAV66zGQGlIpg5abGS
         rxuQZzRBIu8NK+XrVvLpQTSokjlBZBqu7RNQxCLInvC15DTuB5FbhttyMPya771dDDC1
         gp+iVQAJYS0xGhM097mjA6qmpMIDG4tnuDajNDSBTj8TYYg9bP+nDVW+hsHWyQblHT4U
         NxdsmZQyRWiywElIR4g6cjBdDmvguqZibMAfe31IvcGZT39RQ3KV1vPlNRgN/Ug28XhW
         9kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770736447; x=1771341247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/AjyONAcOKw9fyP71DvmCeZOABxEcpsqNv9Hd6xYDg=;
        b=r04A04Hxif7L7q1qJR8izfp4vqDxIZqg+Q7OgSs/YtYbTA2yz6/zuHlVDD9ZNg7mpT
         eSq/tZprdmuWdbYeqOjpbrLjMXRklbiDdyHj2PkGTASX5GOS/7BqFxS4McOf9dpVIC9Q
         yQwD1P55Rgggo28N00A3kyffNPbH0FDy2tW8oGiREwTOqfal2QZRnOZ2h2qPljC4xN2C
         0klEFYBL3y59bOQhUtQ+qGJP4UnHgz093i1dRxMkOLEz82k0puiTQWYUOxyKZzYzpHcx
         Uv85RYuAK9UFLgd1Z+wzsl0Ttvg1VwgVJYOpgRbuu9+fw3L6LbCOayNVyVYkmNFraTNg
         eBFA==
X-Forwarded-Encrypted: i=1; AJvYcCWv4NSCaufd7+Y02pF9mcrv2UH6kKQ2NvnYoqjyGgaTd6B3/g9VGv3dWjs6rPYIz9bRjhCaUEAoY5K9Ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YzizNUsTWskWqyGrHboI53+ERT+LUxDO4cCZ8l85q2kMrl3aBAI
	RQAM//QeEpyHnqkrMzyBdTumFnmzHSE3lfzdzlKRtwTYIZCTo0TN8n+dVl4yPpaaYc0tibArfTZ
	JkUSgU4sgxtge5wnKu3jaC7aAU8D0i/RGoBBaVL57ztERohHEYdoBchNezmBbUksbulenQG8=
X-Gm-Gg: AZuq6aLCPERat5VOPDtkd39K+KmQexg/UerZBqXRSC0AUpaVjvR5Rx+WnPit0YKxn/9
	6IsgEbNLaiP+PAQf8seqa98Wj4uKqZFXEV9LwU4O+KA35qmUC37BKUNzwl6Yr+ZVMV36nuW8ovm
	xqdHb4fYj2gQDu2tlG2oHO/SIX9DThxhtRXnrCl7sBt4axOQdogTwY6+gj4UXvRT0zVZTjJLoHS
	9WZ+2xPo9J5X+gyizcCcdFDsEHQdOO++QCDxBhchyy5cFp5uZWWCUlFpremSghtpDw44z6pQKVF
	sLABbhZ1kP6tcdy261dPldMwXTinOK2OSYwucg2Wuy7udg8CTVaAeodCAbQRvGnvOSAOzK37B2T
	Yp4Rdum3+S5x8iCyYVgfYQz8Hi2o7LcA=
X-Received: by 2002:a05:7301:d19:b0:2b8:3b47:8951 with SMTP id 5a478bee46e88-2ba89c5d6ecmr1033892eec.1.1770736447339;
        Tue, 10 Feb 2026 07:14:07 -0800 (PST)
X-Received: by 2002:a05:7301:d19:b0:2b8:3b47:8951 with SMTP id 5a478bee46e88-2ba89c5d6ecmr1033853eec.1.1770736446266;
        Tue, 10 Feb 2026 07:14:06 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041d9c91sm12648462c88.2.2026.02.10.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:14:05 -0800 (PST)
Date: Tue, 10 Feb 2026 09:14:03 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/8] riscv: cpufeature: Add parsing for B
Message-ID: <hguygejzvtgelem453ercld5udahdy6vydkw6skqjqcsnes4fz@ux5w63fezg4s>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
 <20260207-isa-ext-parse-export-v1-1-a64d3a8bc20a@riscstar.com>
 <rbhjt6qmraoxsdur74mhl2ugy7orr2mb237ynq2sxrraqkl5zm@yc6kim3ic6as>
 <CAH1PCMYMrJoYF4i9vFg1MBkMW+9H9p96RMxqdiQFNC3-KS=7YA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMYMrJoYF4i9vFg1MBkMW+9H9p96RMxqdiQFNC3-KS=7YA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=fcOgCkQF c=1 sm=1 tr=0 ts=698b4b40 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YXCq-Yzi1OOEYlFisuAA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: qNyczEIeKs6IdL21xsTLt4UL4KByOCZt
X-Proofpoint-ORIG-GUID: qNyczEIeKs6IdL21xsTLt4UL4KByOCZt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEyOCBTYWx0ZWRfX4++lT3Qq3Gif
 fJjqouI9SXigo/JJIdJoKDXSJqKUFcR99fr5RNR1UNJekXyluq3D84onkK2nO7BZxnpzW3B5TGD
 Ag5e1qCwMblhD8lSk5xmT+rBBIsYEmOQtjQvmhxwg7UleprWBc3QtsTTWzUoar7S6gpK2L3rUJg
 Niu8wzSb4/PkA9ubsQj+siu/7PTwenFIeq+1zkg21EgyPgd4MA6fIjSFwRXDAPuyzwMCHW1W+RC
 US4Sqx6zLsTFK2ZdK0IpzzQfoagORKdt8Pmr2qQOGGi9Zt1ybeNEfRTAArlvK2utq/z70iKAVQZ
 rJklL1TEohlMGHpya6vjxeoEPCnNK36Gg5ThisBI8A6acGlqgiudjebcRprQQx1BSAWlcw3Cyq7
 qRiJIz6jo+t+epILrf0VIvCjXCOLmVHFqeRU+RJiIN0YIjyJ6QnX4jpB6VWhERQaJA0Txd94tKs
 Lvd5urXybf0isxTC/DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_071409_980141_9047F096 
X-CRM114-Status: GOOD (  15.43  )
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

On Tue, Feb 10, 2026 at 04:15:52PM +0800, Guodong Xu wrote:
...
> > [1] https://lore.kernel.org/all/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/
> 
> With the patches in [1], I would drop the duplicated
> ones from my series (5 of them if I counted correctly),
> and keep only the 3 patches which add SHA and other
> S extensions.
> 
> Would you prefer I send a v2 based on your series, or
> would it be easier for you to pick them up directly?
> Either way works for me.

I can pick yours up, which would allow me to get rid of some
TODOs I have in my patch10.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
