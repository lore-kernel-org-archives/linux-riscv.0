Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFADCD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9JFh2WwcUothecW6CTy1hSkhwR1VSt9epP28po7FD0=; b=csmgclfCLrWClG
	ib/N4rCUkQtsHQWN2/MpuEvYYmBgNatFDGVLegnQLXjlCM9Xd1iX9vMMvFV+Ur6ftRHHI2ggbnhKH
	yr0FJLu8r9SooSlxg8otRe5gwH9mneHPKhnBj98MYpY/hKb2X9cVMSERjG7Inxa8w1NPrMRDn9mtE
	OoLMwDTMIlClVN3XYvzbZ3iml2swCG9iodGWga59tGDIhYQKZs9nx9n2PbdeC2jvf36ziH7AVHMI8
	1+BelEoYk+NVZ782p4NzMaeWJdk/2n+wVBhBpEgmVf0S9GpgmQiudjYqL3QPdbDr+VWwUzecqeLKX
	CnUOlCmmJierUgdSGZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGRe-00000004R1b-1vdf;
	Wed, 27 May 2026 15:45:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGRb-00000004R0d-3TF6
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 15:45:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RFFjkw2282563
	for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 15:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/CAOuwABW/NK0zT7PazBOrFx
	nm1aaFtR/UaMUOazE7M=; b=f+rfGcjE/MvH8t9xNntcx8C7P7IfG8DTuuzgOCkH
	I03Q5Zuf9XBmluzJN21mXjtcHKeV4X/vCJ4vtrVNrWGyM4cRmgh9TaiCWe8k12wo
	Nd5MgZXlVqSNdPFv4JsuNagnvvFVzQ/E/rvrUi4DBIjTmxcypxpNYzh58HzrBIYM
	fmEOpQLZrSu539xc6h04TM3o1gCIynTdm9VIDMhsVF+IDHUKfSGyI742Cz/NuXdn
	35oMa9wu0ZiBanVUadE7rybAeSH11Zk0syW1sSSnqG4nnn5YJ4MI2lOrQN+kJysD
	9ly/U640HIBbNkuJK5lHjNMZs5hcVZAIZO+Xx9ikyEEp6g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvct84u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 15:45:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30457ff05b8so4751703eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779896719; x=1780501519; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CAOuwABW/NK0zT7PazBOrFxnm1aaFtR/UaMUOazE7M=;
        b=BrjIOCxa861mrZsPfAVSs3rPrmsKEd5QJ0uqKcEYwFMIB5XHiFg4rZA2UuY1xIg0My
         RWS9psVH7Gs8PwA3kowqYa/72ojewe4Mu/JlCkJRqDKwOInShXlCM1FsGMWw4jTcQla3
         t/UO+0EqtGx9ClyvHwXgwQojZ1AyTDaOXSQIIIlSODeYViQsQHsww8cRrheF/gwJE/yb
         KQkSd+guCIkqMUYm2X0IMIYg4Nc0QEEbs3fQ0pQVF57VwOasDLyL+pAVVpMsoWoF5MNF
         HCFbKrcR1qFfo4LONfUy/tHvNy2FI4W3vlHYYEROMN4DnSppyG7eAe8drTdOIiJrl3/R
         MfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896719; x=1780501519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CAOuwABW/NK0zT7PazBOrFxnm1aaFtR/UaMUOazE7M=;
        b=ZKm4hp2KvPcN6/OCQtE9+Y8bKrdD5mNtaaz1eKHjXmxgfT+Ltq8PjVrxFyjBO8/YT1
         h2Aribw7bEq4duazROhPViO3dnnHfQCT9L8IKRE4H505YFr984wzG/3EWiENdq7oPHPw
         zWBkQ/1iee3zCaIcw6tEIFZ/U2ud7LXxKzGA38DaqI+9GyBOBNd1b3dyn0ErNm5xZ9ri
         F/jQ38rxYEkp43soILOeBkk1af2gpaA6ZmbSLkhm/qAd3WWpWKowwZ1lNiAeoXljMtbx
         Lf+qfm8Y2TglCwylHTkIDEadBg81VjhJjEXwcYKShoJkHlTevOpSQQUYD/YWAQJYA0p0
         DBVg==
X-Forwarded-Encrypted: i=1; AFNElJ8M608eG3a0d0RahWAK+MxebPIynp1V1lXzGLIIwP1gElZ1EpndCIUyYKj2EsWUssx2KWPKPqSa0XPweQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8SzmEAm6pgt+hyd59J7KOZ9vxR3T4w6lo6tJE9fo74iWsWW4s
	AVRaP0s5XpgNQdypZD3WJgjuL+MqFruReDo24FPwjP6A59bu2RL7ULX7VZLjmPCD6sUkjdehIhI
	QdJ2SE6yuvSv8f2fmlfmTARHM13e+8uFo6lWSRMrv8Z7n1IkF8dDa21Jtaz4P2HgoTGpYY2o=
X-Gm-Gg: Acq92OEbma3oMfCinJr/Oa6OCyOBFWbFasnPfpEtGc6rLWl1dpXct625akSL+n8Jbmp
	PPvfb58cs7WSV9PGwH0VBHlizG6Yh9Kpe03q1T7VRz41Vcq58CHIHun0fRyQ8q4RiQBbOXnI88e
	h3bcjw5t8PaEQtLZTR0OhE0v6FbTZFuZ7tpkQyW/S6dSJKxla12OoqXj+Kg0kjtwlei/hTkvMG9
	wFlbkOqdBgvrpZcgAywaOJBi7GpThQ7KBZihXGv7nslAQ3iKIzsjkzqKfHZTU/tcSh851BF2JJD
	xsfX6MO8uRHucLRmcSrUxXPTgpZ9anRC+VGQfPOG7vm7JEe3xr+SSiDIpJGDBgU0z6oObGiSSWx
	of9grcs2GQlLGnQgcWowImmHW/poIbNU=
X-Received: by 2002:a05:693c:65c7:b0:304:562c:2338 with SMTP id 5a478bee46e88-304562c3085mr5987662eec.14.1779896718224;
        Wed, 27 May 2026 08:45:18 -0700 (PDT)
X-Received: by 2002:a05:693c:65c7:b0:304:562c:2338 with SMTP id 5a478bee46e88-304562c3085mr5987616eec.14.1779896717248;
        Wed, 27 May 2026 08:45:17 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4af0sm13044572eec.3.2026.05.27.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:45:16 -0700 (PDT)
Date: Wed, 27 May 2026 10:45:15 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 02/10] riscv: hwprobe.rst: Replace tabs with spaces
Message-ID: <4otlnil7qj53dzlbvu2wd3gvzzgs5cszo3merkcb2qbbiudw5n@4i2k47coybf4>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-2-21c5a544f1dc@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-2-21c5a544f1dc@riscstar.com>
X-Proofpoint-GUID: nHDpYsARF-z6JuNzcQjScJRdlXXw6OAW
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a17118f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=p7TuRdreTiM3c_8AigcA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1NyBTYWx0ZWRfXwOrX+F7POkox
 e4t3SGOQIyEUI2g2+oZknrAiA/qsm+H/+2i50EP3ZYdysLholzkHDZJAXGDznOLKfwQ9Y7VmO+9
 Qr6qVqAfsPd0nNm6+7mYEnwhcSMTX2r9npSkNLQJbbvtcgO8Qa5Y5hv+WLez+mu9ZDT/ZCc1QCU
 BvcddgTgwruK4fCrHU45JLi+Q5XaQSFstFo397e4PLlLIjagcoAOhlmAMy7XCscBs0VJcmbVqFp
 zgYJbI2eXUS2BEFlj+hDW/1Dm0fYrDM2FBMLbZLS4eM35YOGZ7yTa56zKjwUrYzQYZ6LbXbHp1Z
 X/CgEeSRYbwXYYBF3FX6GHFq+59He/fA9zPvPIVewsERp6Q07b+gy+mCPHnwyTFi41ABxFZzMfa
 pMV/jUI3BI7MP2y45pp55T5wat2UbgLqNdkXCW2v1KKBpt0klmUwb59iezjCjHf27mx/9R7LBun
 NdM2AX9rSyF8eRLTtmg==
X-Proofpoint-ORIG-GUID: nHDpYsARF-z6JuNzcQjScJRdlXXw6OAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_084519_897279_9B94AAA4 
X-CRM114-Status: GOOD (  17.27  )
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

On Mon, May 11, 2026 at 09:34:47PM -0400, Guodong Xu wrote:
> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> A handful of vendor-extension entries indent continuation lines with a
> tab character, while the rest of hwprobe.rst uses spaces. Replace
> those tabs with spaces so the file is consistently space-indented.
> 
> Cosmetic update, no functional change.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: No change.
> ---
>  Documentation/arch/riscv/hwprobe.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

We could just move this patch to the beginning of the series and also use
it to make all indentation consistent in order to fix the consistency
issue I pointed out in the last patch.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
