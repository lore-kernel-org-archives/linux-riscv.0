Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB64C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzsrdYYY8HJiG3bY8byLwsPJgIgKcbGSR+zoq8d22XE=; b=ZYJ2j8Dx4E3eYu
	Dm4br4Rm6XROg2cHQZLNzRFR8z5WSbu2y6Ixbfn0p0QUEMFuQRBw+Wp7xu0hJwAPaSvRTlMe4gnPW
	1N3R8lHiS0sIBe9yFVKaMY2CCiqPhihOAchRZdmprMIJiabQEaOREuz3XmoB2rORT2USX7tJzhzSN
	lLue4uTmO5CdCZqF0AUOMBP40iK9LfKOvZsOg8VhfE8VOsLMWaSwEUtRMuHZAy2hiPsDJLRuKbeKL
	Hhao62oG7kkAy3jeAo00/JRvnk7rSSOOnH5Z1629HRKeCj4PXNnGXrzWata1gPOunN3RcZPGXxpiu
	iqwGjtg5G+G+ieC/YZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjhaZ-0000000252g-0s0E;
	Mon, 11 Mar 2024 15:29:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjhaV-000000024zw-46kv
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 15:29:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-412f62ee005so30935965e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1710170951; x=1710775751; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBRdUgazJ1HnLsYGkRF0jKMpPcVcTcXQbKGRIqRZPjY=;
        b=SIRiMedVACm+i6kyQBtE31+aOcMGGAnSb86rfjjN1WWO1dVPAWRmFax1G14a+x5rNp
         Rcn1top3w6QWAHPqwn6Dt4cvzqSVbnQfAwC8yM4tH9xRP7YRoEtvXRirWfDlUo7pcmLC
         szQ/ki7nIrG23OtW6K08IwcZcLJwJTEg0B4V+ZAexcDfMyVsu63g8jxsWV8kg+Dj9bGm
         uY0cwhGS9YHQeuSTs12iHOgAs+ZxG6GZ7mwSxMdyde70UBNDWJq9zG9/GUCS7l3VmS43
         JURCLUD5xPOAAMb3+D0n1FcSKKp5q3ItBo+RuzlSNao5FwJEzoNKvHBjLnWHl43aW08V
         CN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710170951; x=1710775751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBRdUgazJ1HnLsYGkRF0jKMpPcVcTcXQbKGRIqRZPjY=;
        b=YOYCDSya6WO09EpJ0rHJiCJheynKRCk2qCxET4cIHRvSPbGZOa5m9YEVDv+r5zROUV
         FXe/axV3rFmZiNv368nw/+yjqzOt8RS7Cmib2ZJSJSLJ8SdzBk6JgqvZCoMmNTxNkk+b
         I4rE5WqW9l03btOGyvfrPSqm6sR/yJDgR32ghT5jxLni7Xwa96AHrQAH5ZQJKdjSALzw
         y1BL9uxpZ3SHD6RzK3nnZk2YcCQaY+EqQLjlos4lacl9+TVv1DxBOCLW6A+c/dEfPNfH
         9aS/qjMXaxbrP5e5RLfqQP3TuVpWOHrFCHE0AXxd6TM3R8D2HprK+SRJYRMFnaAoYmV+
         mLIA==
X-Forwarded-Encrypted: i=1; AJvYcCWtpqQAza8sGLnkDn5atPxlvN23Sq35BP019QXVUKRRZW/6FXahA2gIJJdsuuJe0it5Ab/ax2sQIorY6f1nF0NRarfZ6E7J/smfUKGphPWt
X-Gm-Message-State: AOJu0Ywkj1pU95QX1yU/tVtCN2Uk4Mxwe9OhSAnBn0vLzLE1UJUP9G/k
	atipg7+blg1o6PzOyNKEJXlkO6IpL7ROKowtHJT8+DEc8DLPXKvRY5nyGEhsIl0=
X-Google-Smtp-Source: AGHT+IEwgdh7H+9crLcV9S5SLA+JZoumOzg/VaQuwX7biWBYjQ6DqPv+BHttGcsj9IyOJw9JoIyg7w==
X-Received: by 2002:a05:600c:4449:b0:413:1f5c:baa6 with SMTP id v9-20020a05600c444900b004131f5cbaa6mr5344265wmn.30.1710170951441;
        Mon, 11 Mar 2024 08:29:11 -0700 (PDT)
Received: from ?IPV6:2a02:8011:e80c:0:5231:db44:25b0:339e? ([2a02:8011:e80c:0:5231:db44:25b0:339e])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c4f8400b00412ff941abasm15941091wmq.21.2024.03.11.08.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 08:29:11 -0700 (PDT)
Message-ID: <e8f37842-1ddf-4241-97f3-b83ffcb32ddc@isovalent.com>
Date: Mon, 11 Mar 2024 15:29:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 8/9] libbpf: add support for the multi-link of
 tracing
Content-Language: en-GB
To: Menglong Dong <dongmenglong.8@bytedance.com>, andrii@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
 dsahern@kernel.org, dave.hansen@linux.intel.com, x86@kernel.org,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 netdev@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <20240311093526.1010158-9-dongmenglong.8@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_082916_244326_05D25B35 
X-CRM114-Status: GOOD (  12.47  )
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

2024-03-11 09:35 UTC+0000 ~ Menglong Dong <dongmenglong.8@bytedance.com>
> Add support for the attach types of:
> 
> BPF_TRACE_FENTRY_MULTI
> BPF_TRACE_FEXIT_MULTI
> BPF_MODIFY_RETURN_MULTI
> 
> Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
> ---
>  tools/bpf/bpftool/common.c |   3 +
>  tools/lib/bpf/bpf.c        |  10 +++
>  tools/lib/bpf/bpf.h        |   6 ++
>  tools/lib/bpf/libbpf.c     | 168 ++++++++++++++++++++++++++++++++++++-
>  tools/lib/bpf/libbpf.h     |  14 ++++
>  tools/lib/bpf/libbpf.map   |   1 +
>  6 files changed, 199 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/bpf/bpftool/common.c b/tools/bpf/bpftool/common.c
> index cc6e6aae2447..ffc85256671d 100644
> --- a/tools/bpf/bpftool/common.c
> +++ b/tools/bpf/bpftool/common.c
> @@ -1089,6 +1089,9 @@ const char *bpf_attach_type_input_str(enum bpf_attach_type t)
>  	case BPF_TRACE_FENTRY:			return "fentry";
>  	case BPF_TRACE_FEXIT:			return "fexit";
>  	case BPF_MODIFY_RETURN:			return "mod_ret";
> +	case BPF_TRACE_FENTRY_MULTI:		return "fentry_multi";
> +	case BPF_TRACE_FEXIT_MULTI:		return "fexit_multi";
> +	case BPF_MODIFY_RETURN_MULTI:		return "mod_ret_multi";
>  	case BPF_SK_REUSEPORT_SELECT:		return "sk_skb_reuseport_select";
>  	case BPF_SK_REUSEPORT_SELECT_OR_MIGRATE:	return "sk_skb_reuseport_select_or_migrate";
>  	default:	return libbpf_bpf_attach_type_str(t);

Hi, please drop this part in bpftool.

bpf_attach_type_input_str() is used for legacy attach type names that
were used before bpftool switched to libbpf_bpf_attach_type_str(), and
that are still supported today. The names for new attach types should
just be retrieved with libbpf_bpf_attach_type_str(). And function
bpf_attach_type_input_str() is also only used for attaching
cgroup-related programs with "bpftool cgroup (at|de)tach".

Thanks,
Quentin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
