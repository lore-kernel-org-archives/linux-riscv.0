Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017FF606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RAOw3Ob6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5ewi8Si;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iO73xVBY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6XEixw2Kj8gi5stQeWa7Wv6RTcyKmb3mc2JPVWujKBQ=; b=RAOw3Ob6SwEvWgmmC4urEkqMqt
	6IDstrHcCT3dhd5efZ7dr7bEdXE6u3q3sBObkgiE2+61gax8xhy1Y/e6rq5D/Ttl2tY3sggtZKldN
	8qP5xTzPqVWiPprDS4cOdyk6X1ICGWGMEXjao3SrAjoVogy9o0P+ABt1sK/fYVtP/gJdWWLhY+lj7
	g9If88DVcJiixpycTJX3mAXiM04vgs+MH3/8mlHe3D96CQFUXWwiJjFNKVzac82kxasDJ7/FYBog2
	21/K8NEXFxA9faYORGpqbu7UwGmYmjUAbmWwpp/YFuKQGzfw6Yk8lbehv+Z628ZpI5wNnExp0+Z84
	K7zBo91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOSh-000000094aI-2j0T;
	Thu, 29 Oct 2026 11:38:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOSf-000000094Zn-3lXd
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 11:38:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vEwb3825009
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 11:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d+gMCI5zJ/0ncCjFjxtCwKE+
	NZWsbIHy4vH2hFbUCDM=; b=D5ewi8Si/yyUEb4CJLgr2xpoJW6pK614WmguzPBw
	J5FlTgxUj9XZAh+NE9KOm3uJhnohYq0oODVnzC0zXuWRlnWGEa0EpKshXqVexq/V
	YeIqos3s4ctK6PgTrZ6nDAyJaIyWu7IfJZ/H5eVqFhw8q/upJZft8UhNmy5g4gYs
	5v8oEy86bTKoZ6WTVHwQUa4cduU9NSj2a4xh3DaIcSJ5A2gq/4mbwNdYKh7xEi5s
	DKBN7/aB+9Nu0ERYvB0Gej2xy2JSoBHcXD0V+8L2FOtcQj8jg7gAI142AY7+jX4L
	45TLVh2VKZ9QfCGDALDlCzP6GcXAKCzO+bqGPqH3BCm1Ew==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3j5qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 11:38:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so4286228eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 04:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793273904; cv=none;
        d=google.com; s=arc-20260327;
        b=NN13nbePMWKVqFg8ZiAu35G4LT9WIK59aDTzwPYfO6K1sRGqKOkcLDAcEIhKWR8QXt
         UrnZ1XLwTdGEFi/QZ1qKN4GbYL3OBcbBUaFR+9P7fTbfd/nKTN2NPR+tcAvlAPZe6iSy
         4m4N18ow+zQ4jQitNZ8cqvPR1HQk9JuSwk/uFV8LWR1cfl5jdhxZ7CihW+svPbQWhQhR
         GWRZQ8ukviUNXp1aR928KA4KDvNWawdpCu4Wwiz4iLc+ZsN8C3SqCHFqJnT2MMFuvIPi
         tZ2NTqAWkTGaaL2JPwR00rX5Lp95YyMmV3oN+EOkxn4YuX6FCc/4VmLvIvGI9AzEQrVb
         6sgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        fh=ePiS4qiEBEoIBRbdk1085sR89+23WsdbNCzviGjluTM=;
        b=jqhWd8VoE9hOX7qLLD21fXmV4ML4EQl5RO+zlbKXa4Bwxk6sUNKPTeV1QC6UjUrhk1
         xRw4kqXb5rYofYjVVpOHWqV0II4r2oZ9agFRizzNgpIDkMfwEFKPQhovxDDKaduRduel
         Bszh+fEvZVqHXP17MAH7wFICGBD7IbuPSHSD+I7OwUE7dipG4N9Q22Flek0iRSNxlQfa
         mjNdbkEvbjxamMajjaDzeG/BwuIDA8Zk2I5ZvBg/0tkzxbRr4FgdIlSspwU7YH6JZRRd
         uw2q8RIAz6oFNRuD0/58IzWOB521nCca4rNeM3aaLzEWurRW/fVzUGsyloGRI8KtdMVX
         1BJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793273904; x=1793878704; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        b=iO73xVBYQjemBfp9WzweA3GQDLjqNbLbREaLyoQZjwcbEf2s6kkfIHl4M8h8ysrNuD
         8CNaIbbfPNnzCFYcjbniTClThywh0Ep5a4aGKJSzD7QWSMm4br+v+a6YV1TDuWx8cuo7
         7FUtwQ+mHoNuuNnbvxNFPC4AwJXbH0VZHMXGTwRb1h1ZAONrhRzHb8epfNvoenKc5V9t
         fv1papXVhnCTLnpeu/kdxECiVbVJhB4uQPlXUeeKptE44YDhwYgUSlkST0rGVvrQIwT5
         dYVIL+SDNH8fAcDoAStozvKkFjFFq3cxmPsbtAHPUQ304RQwVYqj9wfm6VVC9juLwOHO
         07dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793273904; x=1793878704;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        b=vt06yAdnxba6OeUDoiYcL+QWsvVjhij7mGf+0mabM2bg5DxydpiC1FediZOSe5wyFK
         svTGtZWAHhIGkdmzo+LKoRIS8A7jSd82dELa1BgMuBvXE0A6OXCTHk56jGf1z6j6OJBu
         E48T8XjEBTNGiWfVJ1GRPwvkGDMKtYf2fhKBcfJFGcASVQKrpnDkipGIdjsBvnOR8ofI
         MGavygqojbU8j5+RFfIiNWrG0wMqK1mlwHbcJ3z2ntWEfNgu0LbMVsAEJGGyHkpB5QCe
         dpky+vRhXl+g9G2adgeAMRZBp6A81g47pEgE7ryzFN2X98TM2vogKOXAowVAriB34kS8
         mlBg==
X-Forwarded-Encrypted: i=1; AKwUvBw4z4cp1jD0eMCaPsVsXUEXDrzgCWzvz94NOK1zaQxHFWLmPB8FnN7KpHdHbRcXqYKvy7XION6KxTGRbg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIKQeoj/6qw+myOpIGx1tFe5UNagBK4CFvxJ3MfSuFoT0AEVgPP
	JtkY7Bxy8q83qpvxKb/lAoC959+8Z4XrNaxoQ84jhZRZAbldoTwHreUHodJsiKUVtrjg2snd+7u
	D8e+RUI4VmXqt6xz6RaKUt9y+Wml+CctUOvMXwPEo4ngzUXAusszeSjlccqlSFiAk0WQwsLsINT
	bSmda2zX6bs0H5WALbDS2cU4zyBN19AWuurF0Nq2I6B1MXCA==
X-Gm-Gg: AYBFou0HdNGHxZ+aKTXuLDXIUeFLf5K9tydOdIAh/CoiA2J9fabGgsT0tg9jA4nIA04
	3NN5fblQS2/V/J3ckpJ2T1rm6u9JXW38wjdOz2FHRw+nu3QkvwFOmUitAIq6OkUOSJDBfapkpXa
	sfRbQArWkH22a0EY7smgm+q2ykJvFTjcHPG1sx+4C+RIY7D0qlhV4EcCksjA==
X-Received: by 2002:a05:7301:1888:b0:369:e930:6bc4 with SMTP id 5a478bee46e88-36a20440ab1mr6660886eec.30.1793273904025;
        Thu, 29 Oct 2026 04:38:24 -0700 (PDT)
X-Received: by 2002:a05:7301:1888:b0:369:e930:6bc4 with SMTP id
 5a478bee46e88-36a20440ab1mr6660831eec.30.1793273903447; Thu, 29 Oct 2026
 04:38:23 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:08:11 +0530
X-Gm-Features: AclHuK9mkpiY9HLm48B-7iSzfqzEzMPXUUWrIwq3MFK1djLB6MzLTJk2GLxddQQ
Message-ID: <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
Subject: Re: [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor@kernel.org>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Atish Patra <atish.patra@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
        yuanzhu@bytedance.com, yang.yicong@picoheart.com,
        yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX7Fl4ZpNTA5UB
 Hyxj5lTvh6VtTuCGEqof8aCp3sjmTL9eQHcENkFCjspvJm6wkcuDEJAMdohrYBrjpi5q/nzdn4/
 F841KEnRX6cAHeo+t0zLISGX1iKp/mE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX9VB9nz8ams95
 eNFzxFipM429Tl4CKFbRHyLgjCHxftN+eQADs1PjEyVndjxc49Fm/iP3dNMiW0iPrSMCPqu6KOP
 LpOFhg1igFKetM2XAfw1VLHMW3gZ1MX33IPwFdHNatzaW9410rk22HkOlq+ROnx7iLCaSNWZKW/
 iequTjKqWCw2Jp14R64JNBW4K8RzCE6eSkMQN2XbXHTULK1JPQrkpCEpX0Ml/LbJ4Nx7Qw6E9YZ
 eKfZzsdhfXOaj8dpKSXXZVUgfWJH4ycjo7Ag7LjTyyJ9K2AQojU8SPrNXhZI7sGgTwDKcbiK8oD
 KoCsUEtNJRNwO3GSn+rRYs58pEYX9Blstvl6I6WKG6atFNdcvIg+NFbfB4Z0McaARbOKOkOKs/L
 sXs6/z8OtjwFoA7vMZgKmgYRO+U61k4H0jrCD6ivvMjy9mnrZIp3NypY06Jepm/x0Qyv11DJCtZ
 1TX2ydtJ/hhS7U5+5kA==
X-Proofpoint-ORIG-GUID: 0oct-VNmQOJX0l2WYP3SdbaiYmutiuuR
X-Proofpoint-GUID: 0oct-VNmQOJX0l2WYP3SdbaiYmutiuuR
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae33030 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=ojhntA04eiNvkV59mfQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_043825_941992_05DBE522 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

Hi Zhanpeng,

> [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support

I See only 8 patches out of 11.

Regards
Himanshu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
