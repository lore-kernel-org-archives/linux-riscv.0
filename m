Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1023C98318
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 22:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0GAlQMF88hy6u+7E3cpZRv0eI1rGFncC+SKxk+CUhw=; b=Z5ZXh7XXpZy7kv
	6LUX0GZb1kh7A0DVQ0SM1YqsqeWzz2tjn8vl3V4VEkLP6uDSfOTv/jtXZXKmIlH6LrO8aN4bwATEA
	LeBYkNLG0NX9TemyjJJFtSsm500L794rXGSNRSEGbNpGr0hkRRg+onnNKpP5Q940N9LlqIHxxrBxa
	DQNphQLrTeFMcbHhGhHP1bWQE0tUm8GNgk+9rkidft/os9A9rHd7XpQbMpCPZvc1V2kVvj3qp/+C7
	ZKCiax0jc/PR7f3OSJSpFPMsRKYtIzJoV4mSvrPY9F1/0ENq3OGDm43CVKK3Muh8KSrXcgEidN8QW
	2OfORgvEawK4VNrnNLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sFf-0000000CK4l-2P6D;
	Thu, 24 Sep 2026 22:49:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sFa-0000000CK3A-0RvI
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 22:49:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMOxHk3626785
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 22:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oo8YGRfyp+kAVxf53tgrQWeKF/gkFQ1vpq3RnEKr7OY=; b=UnwyqbzYYs+KvHQI
	pdaCx1jtw5ZY0g35b3TDHY1cZfUiyOOybRzb2dGrJpMmxlONRNVSQrHCIK6+AoC7
	QnvuyVkfsbutTtg/yDMfBQUkcTg+g9F3yaain8P0Plp1XMrZxMEFtivmZwU0CQSe
	ofHBo1aKp2Fj7gieTJXChc0guhXjz78g5/YQm8yV6jdF4DVlAjn/ZKGezuK1U1zf
	EgGFGjtO6diq8oxU1+jfEQZtkOeEUAA1QQjM+IUboDFRrPF9yqUpJATk3M3VjNOY
	A8FRKURil3a5aaVAiLtj8asDhAlxSaEDtDqf0iqQI5xndVjM8Dveu39DfcoA+QTX
	4xyL3w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898s5kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 22:49:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so506413eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 15:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790290147; x=1790894947; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oo8YGRfyp+kAVxf53tgrQWeKF/gkFQ1vpq3RnEKr7OY=;
        b=gU5SJssJjBfDbKzDAp6xdv+PTb8nQFKiBPIOWNbEA+hp0Tk5ILehPAbvCmZ2+M+mCR
         nAR1rBS+w7VXzZbAJK5t1a0NK8fA/UkDG+h169kTDRMA8p0OaM+4nAbweM9ZiP56717T
         4EZun8ZxJRO1IIgYJoRKxJVlZrY2xFHflIhLtGUF6Oq+hFSaHjnt+xgdTrMLRcah3oif
         rJHoPcC3ys2peLys0fjMd9cOtnGsVmE6dRfEmMt6AxGZmPOMVQ3ycCjFCpcj9+KcdzJr
         HsFFYQFEVxQaOUkH8SsR4YPfpU7SaJqZDNe9yhf9cmxZmK1/mQa4LnavvpU64EvVWKxt
         b1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290147; x=1790894947;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oo8YGRfyp+kAVxf53tgrQWeKF/gkFQ1vpq3RnEKr7OY=;
        b=xJD2mL7zECz1LdH0SNv4jRTvK1Wr1S1q1oZJQkQnmPOm95fUKx1vbL3L8kAw2L9Az2
         iI/gET64rY+9p5xh2Tpv6GMF54G92cx+Z/izGThTg/DvEKnmCkt9GAm9bNhwuPW8EFD+
         6R9G2hiO8CLwPdjpk4tiK4bcUmyJZF/oe7FYkzYLXQywTWxAXnbtYdWziqA1VhwxsLu3
         FpFluTPFrUdLXLv/R15KUz3utrBTewULLNbMyWuv1HLevGPkG5CfXnrT6kMHJVjVyJe2
         4sf2el8fU1oSw5zd+GA35uiEw6PpTpe5c4ElObvNsLBtXHlD29yO1RyeLkjyXGqwLk1Q
         cWMg==
X-Forwarded-Encrypted: i=1; AKwUvBxQo7FaMQeBGxG+agpa5mTNAntlsOYu/SP90BiVcg8IIOI9K41YnEOQiPyZ1g2DFSdrrySNSx1/gfg9KA==@lists.infradead.org
X-Gm-Message-State: AFuF++lro5BAyxPUdfz0USGrMEfAzkcUkZVfC/Jjq1p+k7XZOAvZXpUB
	34idXLS61P5AR1N7LZao46mMsYmmG6NqinU5RvfPW9xQsl+gIJmGye9C66UIs8pP2GHTSQB/AXp
	gr/mzqwdgwdJNfZ9sW2nRqLqQdDq9SViG+NddWXGhEe38fDqIwpj1ieegp73NKGThoHySYBs=
X-Gm-Gg: AYBFou1jjpIK3IoJSRqTUo5I+PCEFppXAFwHWIgm/FgA9oaCPJuaSM9fjAtga1Ycvp1
	cAY3/TdlQEz7pWu8AnSWGcEsWsCMeGSG8kbu88SEgnXa4rL080Se+IBNqNHtCKHg01u7I406cqo
	tI5FPlNUNP4TQXIvsEEHXmJey01GXDV4I8/ErgU9x6n2LZJNJ70oIUy+j2gt0qUhYCWz5T3/F2M
	S/K8O7hQVYuOPwF59vifxWs4al0RkoEbA2ABCkTxPOYyK81KSt+XrWrF7IpIkd6RbUtc2rd95II
	b2H6tZ5kyXGQiJjEhl6RQzY2z/N+FUxHkkxMPwZ2UZj9ulTS7QoxTOiBZCgMBXUj0PtcapDTpu5
	CL+9YUzr43VZzW/gn5IbD9+j7y+x7wPLUJQFG4unpcNklHetnSkABew==
X-Received: by 2002:a05:7301:8614:b0:33b:dcbc:6046 with SMTP id 5a478bee46e88-33ffe341a5fmr3054542eec.7.1790290146786;
        Thu, 24 Sep 2026 15:49:06 -0700 (PDT)
X-Received: by 2002:a05:7301:8614:b0:33b:dcbc:6046 with SMTP id 5a478bee46e88-33ffe341a5fmr3054509eec.7.1790290146115;
        Thu, 24 Sep 2026 15:49:06 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407d18fsm1417100eec.10.2026.09.24.15.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:49:05 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:49:02 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, David
 Sterba <dsterba@suse.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Randy
 Dunlap <rdunlap@infradead.org>, Simon Glass <sjg@chromium.org>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Nick Terrell <terrelln@fb.com>, Will Deacon
 <will@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        linux-integrity@vger.kernel.org, Palmer
 Dabbelt <palmer@rivosinc.com>,
        patches@lists.linux.dev, Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH 03/16] efi/libstub: Free cmdline_ptr in efi_pe_entry
Message-ID: <20260924154902.0000528b@oss.qualcomm.com>
In-Reply-To: <3-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<3-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfX4tgXkrbqS87h
 h6m24lBGWbFqXvJETz6GMCnNX3KnTadUtPWstjV1fm55Nv4+qp3NItlT5pxKISdrsKJSHmFLdzm
 zeNgNHj9OFl6DWmHEkWWlJW3t8zfUIOD1e8peQbyy6EH1PoKvpXqivqBWWVOxkuVKJGl1HCxu7B
 oq+4kpjnSsv7rYpL67sqSrnqEODVsifS8laiQmOGGOHsDwd1pKBxOhq2F0lJYDcUkYIAgRa7NJm
 jiPLrpuHxWL4JBcNxwQnnJ1ArM8JYOfDwT4nVN4A7P16LiG0WXIajHS0eOgT/GxA9zmeyWorBQ/
 WF95eVm8ceOX2OJvINhrwTjU8ZPvTE2VqswyXkjDsbWwEHLXi0ruER1OtCtGl3bPHt2haVooky3
 +IR2TTDtJyN3KqtNXs68EPjESXr6IUi1gLTL9awUtUEFieIGrHOjEniGzQH+LK9AxrPCLxp1OeH
 5xlEvJNHi6TURfFfHmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MyBTYWx0ZWRfX6APl2EDilHJB
 pqKiPKx98S71vMSYibowEbxrqHZLJMPztnvsG//s5DEhZpHBJRxdzeRiw/FH6P4X6TDcMHkR8l2
 jvUakPs0EPvRB8XGMJB2BGCXBMVeCQs=
X-Proofpoint-GUID: aAkHAMJBUGp0b2OjQs0splPp1fO4JlCB
X-Proofpoint-ORIG-GUID: aAkHAMJBUGp0b2OjQs0splPp1fO4JlCB
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab5a8e3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Ikd4Dj_1AAAA:8 a=xhtQj0KKqAk-GveBB2QA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_154910_167278_571FFA49 
X-CRM114-Status: GOOD (  20.41  )
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

On Thu, 24 Sep 2026 10:53:06 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Sashiko points out that efi_handle_cmdline() allocates this memory and
> hands it over to the caller. If efi_pe_entry() ever returns it should be
> freed. Add a __free annotation.
> 
> Fixes: 42c8ea3dca09 ("efi: libstub: Factor out EFI stub entrypoint into separate file")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/firmware/efi/libstub/efi-stub-entry.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
> index aa85e910fe595e..83fade2b0d3b84 100644
> --- a/drivers/firmware/efi/libstub/efi-stub-entry.c
> +++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
> @@ -40,7 +40,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>  	unsigned long image_addr;
>  	unsigned long image_size = 0;
>  	/* addr/point and size pairs for memory management*/
> -	char *cmdline_ptr = NULL;
> +	char *cmdline_ptr __free(efi_pool) = NULL;

Can we move this down to just above the call to efi_handle_cmdline that
does the constructor side of this?

I see none of the efi stuff follow those guidance note that went in cleanup.h.

Ah well, not my problem :)

J

>  	efi_guid_t loaded_image_proto = LOADED_IMAGE_PROTOCOL_GUID;
>  	unsigned long reserve_addr = 0;
>  	unsigned long reserve_size = 0;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
