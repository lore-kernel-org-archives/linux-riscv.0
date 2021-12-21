Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93D6C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 17:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjiSZ5avFb5vCYQTC+SmKjii9Hx1j1wzge6t1tvYSH0=; b=PpF8+c3wXRVh7e
	KLUW9WfJkPx0fYLrrb8Az4JGQBo16EGeWiXHW9wuOSuKriHaNgnmExOo9nEDplqo0X6oPhhAtyKQ0
	kV/gwx+IZhReiZiHUjafdFMxxUlVp2BSRT0+HEs9WVYGRFkquDzORKkpVAFea0RdRLSn6WyAFlg1o
	k6w6yXUMNpFJAz4XWFngYIaaNaD3bQHIUAKZDZdfHFweOB5eehZNYrqHmxmW9KeauMY2GyjXBkhz7
	QMcUOFVYhRg32MjXPHryyaWZSIl4mu2ojCEfxsTnDtI5z5oRlLGNFmrJruicXPfqlhVSFdne/fIWX
	RQ1g6Bsd9CyOV6mL7y1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzir9-007omd-UF; Tue, 21 Dec 2021 17:23:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzir6-007ok7-E3
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 17:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640107394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgNFiSHVPmozrMAwLoLE4jQsVCvOy69kXUCzJ2IDG40=;
 b=L003ybUTih8Got4gb9RjwXfSJaX9YobkAaKf3BGQo5EU9V7Ump/FIA1ROJPrG78Rhr/pI9
 fmm4s6qarOaJSorAK0BBIqHCG2T+rf5q5/Of2CPk8jYsWbEVydk0oTjR79G2MpcXxoXxKP
 zOIFOJNfERF4DB4JjdU7VPa2mgGfWog=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-tyoAwzb7O3KSNtQEDseMtg-1; Tue, 21 Dec 2021 12:23:11 -0500
X-MC-Unique: tyoAwzb7O3KSNtQEDseMtg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r8-20020a05600c35c800b00345bfa31160so366490wmq.0
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 09:23:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cgNFiSHVPmozrMAwLoLE4jQsVCvOy69kXUCzJ2IDG40=;
 b=V/A2wnj+nxxuoGx8+dUvpqvsPblvPkOqKG3ynoJxTjP+JdC8uY5VSxgn9gYaMQbLeO
 rPT+T8Vqzs62wUQ6h7lvMetEvLreosZSQlqxfejlimGVatKc/A3klaD1+Gj0fetCYtj7
 m7TYWdv/t0c9h55Xz9JvQSwz0uwkKBeIgao7meOcpd3ObJrqO2Ski3XgqR4isZIjNyuG
 P0S9WZ3WdgC2AjfzcaNd9cMlrF5rX16wNaYRbJ2/q40PhZkHSn5WuU/12OUS8oKz1bdg
 DtZunxA6isOCp79nGhMyyzapEh/+y9M9h/hFh1DNltY5ANpc/NvUoQ52AJpnMlKHaAAO
 M7rA==
X-Gm-Message-State: AOAM533OUFx+49TX83U9Jdy80UrA2oR6POr3eGSTYbWh2Sbj+VqzAZjf
 Y+ftEYeL3S+vXccO1Bk/BWSECxXXurxbj2rTz1fh3rcYWd8Ap0nXvAWmc19H8iiXX5Fyu1JsNyb
 2XGgPGbDmK1M9v8u3WFMuDC2siYip
X-Received: by 2002:a05:6000:18ae:: with SMTP id
 b14mr2939928wri.358.1640107389835; 
 Tue, 21 Dec 2021 09:23:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyI+sgOMHf0YSbgDUY4Hz0bbMnBZ39bzuZPfnty8IjP5PgtILbNjQUHQYlB5n/1B8EGxd5qNw==
X-Received: by 2002:a05:6000:18ae:: with SMTP id
 b14mr2939904wri.358.1640107389571; 
 Tue, 21 Dec 2021 09:23:09 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id c8sm10962302wrp.40.2021.12.21.09.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 09:23:09 -0800 (PST)
Message-ID: <4d739c28-e07d-f921-8a8d-a5343139e234@redhat.com>
Date: Tue, 21 Dec 2021 18:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] KVM: selftests: Fix compile error for non-x86
 vm_compute_max_gfn()
To: Shuah Khan <skhan@linuxfoundation.org>, Anup Patel <anup.patel@wdc.com>,
 Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20211221125617.932371-1-anup.patel@wdc.com>
 <3e3b5295-f6fb-1ff9-acfe-1a4c47c6ba20@linuxfoundation.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <3e3b5295-f6fb-1ff9-acfe-1a4c47c6ba20@linuxfoundation.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_092316_597257_8D07093E 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/21/21 18:22, Shuah Khan wrote:
> On 12/21/21 5:56 AM, Anup Patel wrote:
>> The inline version of vm_compute_max_gfn() in kvm_util.h directly
>> access members of "struct kvm_vm" which causes compile errors for
>> non-x86 architectures because lib/elf.c includes "kvm_util.h" before
>> "kvm_util_internal.h".
>>
>> This patch fixes above described compile error by converting inline
>> version of vm_compute_max_gfn() into a macro.
> 
> Thank you for the patch. Please include the actual compile error in the
> change log and send v2,

Hi, a similar patch is already queued and should get to Linus today or 
tomorrow.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
