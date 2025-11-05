Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226CACCFA0D
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 10:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbAEEvf9AwXLnncks6tfj0NROIT+/HJU4J+XSZEhq7o=; b=0iVJFWt6YVd20w
	AQYSMrXw/0f0s88hjns108vW6P9KGnnnfS8C/iAbh2Hgj1FBiuYDNOTKQR+E0BZW7P2WnkMrIUefH
	S+hjRdS8xoAz45J3yQDSoNvSH2S7haPzZvSX/1elz2iBNUcFlfvPMop/vYW/oeg8oiWsuulROnPpY
	9KOA4GwfZBCzce6yNxkVPYkNbeiSLe+wS4tUCBppd2QT8nLTBfalSTBIBJwlJWJfcCW9Pdvnr5VHs
	KYvG8mZl6Q/B5B0P3zsUYOmPbX/XpKZkg3DTq0BwGzunAsGdax8KwLkRy6dl3hD8f7jLcJs9X1uqz
	JZI3nVJn5mFJ4CVukAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGapM-0000000DTY7-0YEw;
	Wed, 05 Nov 2025 10:33:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGapJ-0000000DTXl-3Lzb
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 10:33:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2952048eb88so71681015ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 02:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762338797; x=1762943597; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39uIckh4SoWr03ZIJh4ib+/wvpmKdVIU8qgMasnqseQ=;
        b=YtVuI3nkhJ4F7p2XaLAxnodE6rjP5CstDqWBZ91g9hkK44Ec4H3HHWcK4DXk6VLX+1
         8tle7J7do7VoUQVvLZY7Ou4p925tgeMaaC9Apyel58uOg6mFB38rw+gclrFphWLAO4oq
         75K4QhzjatooP5aSNtR3/H8bWmhjWOAJcaJ8MPd/iDLcVx45QC/upsmkBBCJZEWge1kF
         xaTo3LQ1hRZbIs/WJxh/GWzOsvStyLHwdtvndPt/LUhlYxTT3ShQBefxEeHkNekIUyjF
         kftoxRpUcmlP7R2pC6QqSeiXA84A7JUWjdHmnTCfcyFVyHkLJgR0KMOHrGV90dygxefM
         a2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762338797; x=1762943597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39uIckh4SoWr03ZIJh4ib+/wvpmKdVIU8qgMasnqseQ=;
        b=N+TcLdH/9jph7L5Vmp89211dtNWxE/G6bMzsTvyzlDoVK1dXOvscvbLfZ9+Lp2dQ9U
         TqcC0adWDyCA+Fg+mmQVBSejbpqHZ3GxEMO8BqJ1rFh1FwSD/M/dy+sc5h8fyDjR/lXO
         Em7R7jmUxFbjxpSvX8IXCwFYCvD7mjXSQbHsllalPoIGuvKOiDCWpiBpVtd9Wo7w1QpL
         K1dlmmwmcTfRbefr5K9YGEQWH7cUbzZTS6oY+coR0sr80R/z8FPyWr/hO9ax6Iol8s9Y
         OguTVXhzXEGjxYH+2VWlgRsIdMcWwRK+FbVYyJlfUSo2ae8X34Q6hZ52ccwAFWQYv86x
         yzXg==
X-Forwarded-Encrypted: i=1; AJvYcCUfWFKMgySI4wfNv1n71487Yi4A+jSzFqmRh0k+AQAynyasmqMMnBniB0MAND1yBCUbsIpMRsDC33kUuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUT99DBZ2HgvE56b3mCEK8A43i/+o3UgWbmcZHo0wEp1dFpuC+
	Xz/GLiDTDPGLvXZgFH4j3vAZswWCX9kYpGECg7LWWVtdjb9eqRXZrnwrl+V18S82eqM=
X-Gm-Gg: ASbGncs0UQTZ7UR0CfmqE3PhKRF6+qwAp5B1f0gly1Py8LSXCMAiw/SqOqLe2HF/als
	U3yxOgQIbiGeA5c70Kn9f08OR4cZmPeWlV3OMWGcz7fI+w7FPgb3HeiSaWPNyJ3GDcbUT0XsLIO
	/1ayxUOCMvyJxDxlupeYZrP1q/b6Y9BIDuJlwsL687Mt9OmAHcH4jTyJdrSPX1DcoAPae1US94J
	44k7SpDjPteEtGgLId6ka+Kj57nTDPT8xSGMR52PkwcIBEWbcvDhfzG09sN0mCeUfa9lKzJykEb
	OE4lqCk2RBS/cxfyjjXlIsxPhPudR0d/eCgZJO2fkMhp97ZM0W9D1CCJZFwe3CqYBb4uX0m40QK
	tlL71rTvsLYYybFy5g4wMFkrD2U0OrJVfOTLcgOO8ofTf/tFYxdYlxabK3JPIbOa2wqqCyyliFS
	VamwSLtO/k8D94cmmsrPca+iIeDsittMzk1BtJ042dS2fq5w==
X-Google-Smtp-Source: AGHT+IHdw/96/OCAC1Nx+H3pSqIGsf399zmz5OwGHSCzXvqg9BWyA4UoKggLFqHvpU21yZ0+LgXqjw==
X-Received: by 2002:a17:902:e54e:b0:295:8db9:3059 with SMTP id d9443c01a7336-2962ada1d5fmr42185075ad.38.1762338796647;
        Wed, 05 Nov 2025 02:33:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a60761sm55885165ad.90.2025.11.05.02.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 02:33:15 -0800 (PST)
Message-ID: <7b267b11-a204-447e-afc6-86722518cf58@rivosinc.com>
Date: Wed, 5 Nov 2025 11:33:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/10] riscv: Add functions to register ghes having
 SSE notification
To: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
 acpica-devel@lists.linux.dev
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
 <20251029112649.3811657-7-hchauhan@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20251029112649.3811657-7-hchauhan@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_023317_857895_3AD5F0E6 
X-CRM114-Status: GOOD (  28.55  )
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
Cc: apatel@ventanamicro.com, tony.luck@intel.com, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 10/29/25 12:26, Himanshu Chauhan wrote:
> Add functions to register the ghes entries which have SSE as
> notification type. The vector inside the ghes is the SSE event
> ID that should be registered.
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  drivers/firmware/riscv/riscv_sbi_sse.c | 147 +++++++++++++++++++++++++
>  include/linux/riscv_sbi_sse.h          |  16 +++
>  2 files changed, 163 insertions(+)
> 
> diff --git a/drivers/firmware/riscv/riscv_sbi_sse.c b/drivers/firmware/riscv/riscv_sbi_sse.c
> index 6561c7acdaaa..46ebc9e9651c 100644
> --- a/drivers/firmware/riscv/riscv_sbi_sse.c
> +++ b/drivers/firmware/riscv/riscv_sbi_sse.c
> @@ -5,6 +5,8 @@
>  
>  #define pr_fmt(fmt) "sse: " fmt
>  
> +#include <acpi/ghes.h>
> +#include <linux/acpi.h>
>  #include <linux/cpu.h>
>  #include <linux/cpuhotplug.h>
>  #include <linux/cpu_pm.h>
> @@ -700,3 +702,148 @@ static int __init sse_init(void)
>  	return ret;
>  }
>  arch_initcall(sse_init);
> +
> +struct sse_ghes_callback {
> +	struct list_head head;
> +	struct ghes *ghes;
> +	sse_event_handler_fn *callback;
> +};
> +
> +struct sse_ghes_event_data {
> +	struct list_head head;
> +	u32 event_num;
> +	struct list_head callback_list;
> +	struct sse_event *event;
> +};
> +
> +static DEFINE_SPINLOCK(sse_ghes_event_list_lock);
> +static LIST_HEAD(sse_ghes_event_list);

Hi Himanshu,

Please declare these structs/functions at the beggining of the file.

> +
> +static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
> +{
> +	struct sse_ghes_event_data *ev_data = arg;
> +	struct sse_ghes_callback *cb = NULL;
> +
> +	list_for_each_entry(cb, &ev_data->callback_list, head) {
> +		if (cb && cb->ghes && cb->callback) {
> +			cb->callback(ev_data->event_num, cb->ghes, regs);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int sse_register_ghes(struct ghes *ghes, sse_event_handler_fn *lo_cb,
> +		      sse_event_handler_fn *hi_cb)
> +{
> +	struct sse_ghes_event_data *ev_data, *evd;
> +	struct sse_ghes_callback *cb;
> +	u32 ev_num;
> +	int err;
> +
> +	if (!sse_available)
> +		return -EOPNOTSUPP;
> +	if (!ghes || !lo_cb || !hi_cb)
> +		return -EINVAL;
> +
> +	ev_num = ghes->generic->notify.vector;
> +
> +	ev_data = NULL;
> +	spin_lock(&sse_ghes_event_list_lock);
> +	list_for_each_entry(evd, &sse_ghes_event_list, head) {
> +		if (evd->event_num == ev_num) {
> +			ev_data = evd;
> +			break;
> +		}
> +	}
> +	spin_unlock(&sse_ghes_event_list_lock);

That lock should cover the whole ev_data creation. Because if two CPUs
enters this function at the same time, the following scneario can occur:

   CPU0               CPU1
   lock
   ev_data = NULL
   unlock
                      lock
		      ev_data = NULL
                      unlock
	
   create ev_data     create ev_data

 -> Both will have read a ev_data = NULL and create an ev_data.

The lock should be kept and unlocked at the end of the function, you can
use a guard() for that.

> +
> +	if (!ev_data) {
> +		ev_data = kzalloc(sizeof(*ev_data), GFP_KERNEL);
> +		if (!ev_data)
> +			return -ENOMEM;
> +
> +		INIT_LIST_HEAD(&ev_data->head);

I think this isn't necessary since list_add_tail() will anyway overwrite
the head->next/prev field. BTW it's confusing to call this member head
since it will be used as a node in the list. It could probably be
renamed node/list.

> +		ev_data->event_num = ev_num;
> +
> +		INIT_LIST_HEAD(&ev_data->callback_list);
> +
> +		ev_data->event = sse_event_register(ev_num, ev_num,
> +						    sse_ghes_handler, ev_data);
> +		if (IS_ERR(ev_data->event)) {
> +			pr_err("%s: Couldn't register event 0x%x\n", __func__, ev_num);
> +			kfree(ev_data);
> +			return -ENOMEM;
> +		}
> +
> +		err = sse_event_enable(ev_data->event);
> +		if (err) {
> +			pr_err("%s: Couldn't enable event 0x%x\n", __func__, ev_num);
> +			sse_event_unregister(ev_data->event);
> +			kfree(ev_data);
> +			return err;
> +		}
> +
> +		spin_lock(&sse_ghes_event_list_lock);
> +		list_add_tail(&ev_data->head, &sse_ghes_event_list);
> +		spin_unlock(&sse_ghes_event_list_lock);
> +	}
> +
> +	list_for_each_entry(cb, &ev_data->callback_list, head) {
> +		if (cb->ghes == ghes)
> +			return -EALREADY;
> +	}
> +
> +	cb = kzalloc(sizeof(*cb), GFP_KERNEL);
> +	if (!cb)
> +		return -ENOMEM;
> +	INIT_LIST_HEAD(&cb->head);
> +	cb->ghes = ghes;
> +	cb->callback = lo_cb;
> +	list_add_tail(&cb->head, &ev_data->callback_list);

AFAIU, at this point, the SSE event is already enabled, it means the
sse_ghes_handler() can be called. This one can potentially access
&ev_data->callback_list concurrently which would result in a corrupted
list. You should mask/disable the SSE event while adding the callback to
this list.

BTW, accessing the ev_data->callback here means that if multiple CPUs
access this function at the same time, it could result in a corrupted
ev_data list. Not sure if it can happen but better be safe than sorry.

> +
> +	return 0;
> +}
> +
> +int sse_unregister_ghes(struct ghes *ghes)
> +{
> +	struct sse_ghes_event_data *ev_data, *tmp;
> +	struct sse_ghes_callback *cb;
> +	int free_ev_data = 0;
> +
> +	if (!ghes)
> +		return -EINVAL;
> +
> +	spin_lock(&sse_ghes_event_list_lock);
> +
> +	list_for_each_entry_safe(ev_data, tmp, &sse_ghes_event_list, head) {
> +		list_for_each_entry(cb, &ev_data->callback_list, head) {
> +			if (cb->ghes != ghes)
> +				continue;
> +
> +			list_del(&cb->head);
> +			kfree(cb);
> +			break;
> +		}
> +
> +		if (list_empty(&ev_data->callback_list))
> +			free_ev_data = 1;
> +
> +		if (free_ev_data) {

Remove free_ev_data and use the following:

		if (list_empty(&ev_data->callback_list)) {> +		
spin_unlock(&sse_ghes_event_list_lock);
> +
> +			sse_event_disable(ev_data->event);
> +			sse_event_unregister(ev_data->event);
> +			ev_data->event = NULL;
> +
> +			spin_lock(&sse_ghes_event_list_lock);
> +
> +			list_del(&ev_data->head);
> +			kfree(ev_data);
> +		}
> +	}
> +
> +	spin_unlock(&sse_ghes_event_list_lock);
> +
> +	return 0;
> +}

Please declare this above the arch_initcall() function

> diff --git a/include/linux/riscv_sbi_sse.h b/include/linux/riscv_sbi_sse.h
> index a1b58e89dd19..cd615b479f82 100644
> --- a/include/linux/riscv_sbi_sse.h
> +++ b/include/linux/riscv_sbi_sse.h
> @@ -11,6 +11,7 @@
>  
>  struct sse_event;
>  struct pt_regs;
> +struct ghes;
>  
>  typedef int (sse_event_handler_fn)(u32 event_num, void *arg,
>  				   struct pt_regs *regs);
> @@ -24,6 +25,10 @@ void sse_event_unregister(struct sse_event *evt);
>  
>  int sse_event_set_target_cpu(struct sse_event *sse_evt, unsigned int cpu);
>  
> +int sse_register_ghes(struct ghes *ghes, sse_event_handler_fn *lo_cb,
> +		      sse_event_handler_fn *hi_cb);
> +int sse_unregister_ghes(struct ghes *ghes);
> +
>  int sse_event_enable(struct sse_event *sse_evt);
>  
>  void sse_event_disable(struct sse_event *sse_evt);
> @@ -47,6 +52,17 @@ static inline int sse_event_set_target_cpu(struct sse_event *sse_evt,
>  	return -EOPNOTSUPP;
>  }
>  
> +static inline int sse_register_ghes(struct ghes *ghes, sse_event_handler_fn *lo_cb,
> +				    sse_event_handler_fn *hi_cb)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int sse_unregister_ghes(struct ghes *ghes)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>  static inline int sse_event_enable(struct sse_event *sse_evt)
>  {
>  	return -EOPNOTSUPP;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
