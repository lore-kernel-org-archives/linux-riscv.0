Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C408ECD5BD0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuA8wXdBjozAtVpKsq5/c7yw7fEGEMIDFkwErqARKK8=; b=dJwQXje/St/aKv
	+ycKqnlbBAAHVUZzHVNCRjQrrvZkH3gHPpRnNUjSbL+uehOEGLafJT98eIyvgumGiJouN+BgfXVHC
	otSkl/GxzzUN5x1jjUihEpIl9RodutGfaSf0ph30nXbMH2h/tj5BTcYExMyIEyRdovL2rUSZRX/T9
	acTj0MuBBhyRikM9a8m/PNFZheMoFyZFNDdz0kWIrAiOatFl4RcA7I0sX3r8exEdbKTSgcOMlsymV
	5cCVjrw1DRo3TIIQ86GN+V+1PN9HtB6gfTTBkZRY7syYf+COyoRfgVhqQ483DnlfoRQK28SRONkrQ
	4P8DUftuqemQ+tyKEgiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHg5-00000004YnN-2Vue;
	Wed, 27 May 2026 17:04:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHg2-00000004YmV-2MTr
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 17:04:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RC4uKL1477926
	for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 17:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6nha1feETo1rSKy37ATFEomW
	axLqzR6X6eFWdjB9xhc=; b=BEhQsBXLxYXh8B8T4cuZBzpDXJy3V8d+KSBqaJlf
	8sMlakShjajq9oljZ3x6QQUTUWxdjaS1K8zrY51pShQoNAtfCHbkF/qRVQ4806fX
	8Awxj+JRtqVusORT3KT+sztSa4ZJ2PoSXh92SrF6LKQlyhDhkCf9XIwov8+bcOb3
	t+lN4BDuP+oC99RaAC3XHQa7hX0pVxJtgMyxkU79vGGYD0FjiVv3YkvMIA+p62je
	1UPexMftSDe7A3quTUDCsQxZwKkysqk+ZtNzIxnIF0Xp4NA03HH7XflYoCUfNSgx
	ddqPAfK7LBeaGvoEanBhjSxltpWq0ekeP06TbBLuE6Gqog==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee0a895ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 17:04:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13509e2e47bso14495851c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 10:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779901456; x=1780506256; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6nha1feETo1rSKy37ATFEomWaxLqzR6X6eFWdjB9xhc=;
        b=TwPdGPoil3Cf2zrQMucWAmojrbdPS0VD/XgvGy/seIbNMitZz4N9EyF3mQnWY3pLQu
         xhgz4aESQUyy7wfOtJ4AqJfrxMu3rs6/mqvfrXqY+vsGnqIupjCfXqgshkDlXiZfXCSE
         WD5OVLw1+7tN00QhLz5vfAvZ0jrYZn2uoJLpv4OyjAB04Kl9pP7NcGuZnawRIsn0Qmy7
         AFUJ4jnFTddSoCjgpP0VHRiBDtoTpTeTz4sypMsNYZhyXnacE4q2AJSzXvjRL8IBF3QT
         NJwxAN/IDEq9CykeobxG8HeT+FXG4w1hLJEmIwkLgIB8mJMEnG9gVg3hCKX89WkQ2Jd1
         GooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779901456; x=1780506256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nha1feETo1rSKy37ATFEomWaxLqzR6X6eFWdjB9xhc=;
        b=eOX2XSXseFgYEQZca4OP4+nWhsdGTII8kjBWTPX40JhzUZdEO4cmLJtpWROcAMR+gO
         PYqGV1RXwieDgV5341dQxPd60668rtMTUYsRXMO5HDNvaKDrt/bHI200ykmBQ0fvq74W
         VcEwqs/FgfcKOPT9dPNXXPvE8kecc4Y4HbgB78K86Einqq5ShhAsVowX6BLJAfJhk//+
         6YfoCgre6RjKQ/W+wAinOvR3onok9JlWNzO2ac5cYyN9swgniiCrIu5gDZgH3WLelGtV
         2zKjc7MQ+iVIim70Anb1JHuZgWYAR/6BgFi4bomdkdZY+Kgq0xlhSXjWk+uIDocWXBlH
         euvw==
X-Forwarded-Encrypted: i=1; AFNElJ9mFl+vOisujdWzxGdZhRB1i6Y/UiEGYeLWt5G43qSKKZAHG3oD2DzWfv5Poke2q0ZGtdzDCaLnNAbEMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0PrA7XwbsmV6LspAL6t6+IoRwib2EhTdpujyXToP+9g1qg7QP
	QOpV6gRtVwPEQSHxBOTO28wELeOv83jckmrLLglfVBF5oDxqQBl8E6aJSC08Pz3JiZ1z6PaS0fU
	/K/vn4g1zoNUD0y0/bqG9fMSfa9AwCdTmXomMfedLLT/f9poX8x1QnYkpnr75lb5xnEI5PS8=
X-Gm-Gg: Acq92OE1+O3BOuG8HIOy8IsbvnSgA95L7TRjjWPWNTKgA0d4fZUeYOBQsBTXAP74dXo
	XwFoq2cTWCBXzUmKnP5Jn3ZMaYG9mlY0+mk6lBu5NhfndCLfznSl1nIrtRDsGSNSErBVlPns6Cm
	jbzq73GkssRb7IEw70g0Oj0eiCATM3aCUKMl8Q102JRndXwXa9adUTjw45l18o8xS69/brpe4u8
	cXyI8pzsocjLToYw/GQslqmo2mHC62YHT03YMkKbU76bH0NWZjKD/o8WqwyiynTc0FeY33tytUt
	6RSeoYp7jZBQaGe1aNzhwHPs5fPlRRbmLLekKM5tTphXqKolywVh6oF1zlU3gpttEl+hi8P1HkP
	3mJp9mFawHJE7XF2LsiGsDaXav6YnS5cQ5p0cIs2ebA==
X-Received: by 2002:a05:7022:258f:b0:137:6c0d:b990 with SMTP id a92af1059eb24-1376c0dba8emr719569c88.25.1779901455912;
        Wed, 27 May 2026 10:04:15 -0700 (PDT)
X-Received: by 2002:a05:7022:258f:b0:137:6c0d:b990 with SMTP id a92af1059eb24-1376c0dba8emr719548c88.25.1779901455346;
        Wed, 27 May 2026 10:04:15 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aa88eccsm10819104c88.9.2026.05.27.10.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:04:14 -0700 (PDT)
Date: Wed, 27 May 2026 12:04:13 -0500
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
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <bfap4hslksgmfosoy2c4g5qgrhk6ofd72e6f3f2qxpojey5yuc@74jvqlfe3urw>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
X-Authority-Analysis: v=2.4 cv=XrrK/1F9 c=1 sm=1 tr=0 ts=6a172411 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DOyYl3NULbmlVlinG0MA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: _pwPvq_4_1J0AYM0qSUUGlw843VC5gQz
X-Proofpoint-ORIG-GUID: _pwPvq_4_1J0AYM0qSUUGlw843VC5gQz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE3MSBTYWx0ZWRfX9iBMibXJXR7/
 zutFxaqDIgDnWUR9C2O6Z9sdh3l7U2ZgiZoHPG/bphBiaWabFL72R1OYuorYG/WGL5kV3hU/N3J
 TpZpKpITFOOUiicWuhXOiH1YkeYy1GiaVtHQ78G+Lu0kjwT4v1r653+YmS6gyMPYwo5gStXqG2T
 t0uyJR3NDxWGAfuPhRgcp1rQLm6AB48XucjYgRcnTRQVHY2PrgIouGAhU/QPxoUUR6EbLZr2HAs
 80waU6S/9LPz4B7nHlGhf+guicHfxYXjYxFZccxaRDkrEvFeQF4ZwM+heG0f4KYATHYpquPQdCX
 RzEn+Et+ONynNBOiGd53ulXS/f9pU5XGSgeP0knCnco3RJiOSOynZoZCHv+wnNenPD8/3/lcbMy
 R0AVhnGHOIlvQSvA03lXk4ofhVOj0LKqWtgPtVsNhxb+J5Soa/ogV95zKz1D9qKc/pnkLo0SwiP
 QC142BMAkqYWwSfP9Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_100418_718606_D737B3BE 
X-CRM114-Status: GOOD (  11.68  )
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

On Mon, May 11, 2026 at 09:34:53PM -0400, Guodong Xu wrote:
...
> +	/* Zic64b and Supm with PMLEN=7 */
> +	if (riscv_cbom_block_size != 64 ||
> +	    riscv_cbop_block_size != 64 ||
> +	    riscv_cboz_block_size != 64 ||

The only mandated RVA23U64 extension we don't have ISA string support for
is Zic64b. I wonder if we shouldn't add that support too where it would
have a validate check like above.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
