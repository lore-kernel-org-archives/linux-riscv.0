Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB1CC55174
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 18:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WelyZs3HSivWU3rGLuHM2E2rCZ9bJo0L/LK4woqvJI8=; b=ZPjjuMRRdvHRpl
	U1WG8NcUsIhFNpB7cqooJPUETom9hsurF23bYqGK2xWK/D4zypLZY6e/NvQFT76JsWyJXen+cTd/k
	BPxSfXAkOMKdGJmmnQ2hk+yICEr2mIrtR0NO2UG+EJWEgBpJRFFY03wUn++3JEKlrc2ZJ8lR29rEN
	bIlVZQT4p7ToUsILC39ZO82Iia3tH/mtwlcLWFAUQdIoFqBPLLfXMLZ3vx3AvsqhfqWj/v4KQ4D0d
	7cT2vG95dJtjGb+zL7evC/Nvm10sX7TGtA1VmzLnwHHBBv/7qz1nrjL4PmsjqNYe+ZkVD2a+6/aNH
	ocGmSh5WMfjwwHsiJO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgXb-00000004PZx-0rzl;
	Wed, 05 Aug 2026 18:40:35 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgXY-00000004PZ0-1I2I
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 18:40:33 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7ec49608332so729354a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Aug 2026 11:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1785955231; x=1786560031; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2ZwIEMBkvqF+IdFhwC9OUYBf8UgY4VA+Dk6J9NvywQ=;
        b=e+DkDM3OkO8nE56ZcQpIiVfycdQ0etIxfcTcNk1GaOOm114Uo9dZ39pUQGtH9nVXCK
         LIRNeDRmSEbad1baeaRXGH2qLOUPlFAuK2EKMePi5vUgl9gqexh/SYZZoETe/HECkpv0
         jGpNYc/7UqOmw/jhg6hGR7xSEMoztfzlq8LsXmrhW/B3DFXBRWZHrX6mLW/3pMzki+sj
         a4aasxU3A9XxpvGc5nDLHtKwf8mwF6agP7JCNM0Bg+9g6HP8xSkzdxgEne1M9HMeZZAu
         iCgRYB8/qFmby1fQYapnj2QGUhWeY++gr90jrNqdksJJb2t7e2JbG5rvhibx7kqWCN1O
         1Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955231; x=1786560031;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2ZwIEMBkvqF+IdFhwC9OUYBf8UgY4VA+Dk6J9NvywQ=;
        b=WEglkvXHcdCqOcOxFaEcenbQEu72d3m0KgJfHdBwGBCoH44LKS5qT14vSTQLRetI55
         XyyPxkfRqcZ9ARwZHsyI5YpcXy+UGsD9hKsD7+h0aV5ofyuFqPksPtxJ90ZFgEY32P91
         9CqseqHgconLok5PiReY/HXDnhAHR0nBhNUU6mHTsn2y/VYKbVxYxCkNimNh9Q0oXS+X
         Qi2gc5uMjV3GYm2vDDotahbB2mQFg8kNSDW50Fnw2CzqEsdfJ5S6enx2V6Hd3lLsi7H4
         er1cgkK5RVESElO605AXBWVV+lNv5Yzm4R5gpfdRoykhsTG+2oSAbtzwh5fcJulbaqka
         8GQw==
X-Forwarded-Encrypted: i=1; AHgh+RpIAZMgfoNbRBRFFb090Fk4bZgP7rtGn7mY0LrjQ6OplryugSEQJ0AWz4Yjp59vfbGt/U//FHd5DbwiNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvYMeKfLX08gAuKwucqskdyGl0f+Kkw9TyDDarVCcQpGmYvuXC
	6B825vtvI9rWgbiYCTev5mEll+VAB/rrhwFlZPgrrn/03q97lgWi/UiHR93VF8tmuHriG6ClM8c
	br3pNB3qGMA==
X-Gm-Gg: AR+sD11RBEgcSX/Rvj420M3l3C5MQxypv8NMTAe10OhP2bXvp59au3cAIs7rlPaBhCx
	6rBMhXDGFSFPobtPEPfO6sMECNqP1+5B8FsONFtQ/f71OA5V2mduDzXhHfUoHaAL7S4q2d2PCJU
	WbXOWnk7e9TewiVZX9PiCq4C1PtBeaC87OyfJD/Pg4sSqNsvGxAm4a8VaRUFM5UJgyGNZ7OEsdy
	MJXGDorCJOfqvUynvcxx8orxRsEFbEa2/1jrqZfulxOkDWqdQKuCJ78wQL8QYQ9xvyRgvhWw6la
	VM/r3caGmg4n1JLsqT4RUxRFrDosmEJHsOFxKymE88A2CbUw/YaXR72e+0JIknIpbV1/ytXQ2/5
	vUAcoNWRhwdazFEQjrjCIirn3KDGc8eN5bwFt4C0OjQXzoYo3XgR0NJ9kFYKIZLj3weD9vWybjm
	00dLdUcchl+E/cHA72x+BvTNKcHxUBipEiZ+l1JjSu+Hkd+aFgDhFjwo+70LXfPdYg+LXOkWZsp
	HDmr4PBnBOmfVxS
X-Received: by 2002:a05:6820:4d0b:b0:6a1:83aa:4439 with SMTP id 006d021491bc7-6ae96ed3988mr4754367eaf.18.1785955230895;
        Wed, 05 Aug 2026 11:40:30 -0700 (PDT)
Received: from [192.168.86.29] ([47.232.46.70])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae94012334sm4073784eaf.9.2026.08.05.11.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 11:40:29 -0700 (PDT)
Message-ID: <cc671848-f954-41bf-b7a9-ba34c29593ec@oss.tenstorrent.com>
Date: Wed, 5 Aug 2026 13:40:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH 1/2] riscv: hwprobe: export the availability of
 vector to user
To: Florian Weimer <fweimer@redhat.com>, Andy Chiu <tchiu@tenstorrent.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 kito.cheng@sifive.com, dfustini@oss.tenstorrent.com,
 greentime.hu@sifive.com, Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Nutty Liu <nutty.liu@hotmail.com>,
 Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
 Yao Zihong <zihong.plct@isrc.iscas.ac.cn>, Xu Lu
 <luxu.kernel@bytedance.com>, Aleksa Paunovic
 <aleksa.paunovic@htecgroup.com>, Jingwei Wang <wangjingwei@iscas.ac.cn>,
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-api@vger.kernel.org, Jeffrey Law <jeffrey.law@oss.qualcomm.com>
References: <20260723222109.2229089-1-tchiu@tenstorrent.com>
 <20260723222109.2229089-2-tchiu@tenstorrent.com>
 <87bjbwk0q5.fsf@oldenburg.str.redhat.com>
From: Peter Bergner <bergner@oss.tenstorrent.com>
Content-Language: en-US
In-Reply-To: <87bjbwk0q5.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_114032_462733_89BB7BAC 
X-CRM114-Status: GOOD (  15.45  )
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

Back from vacation and I don't see that Florian's question was answered, so...
Also adding Jeff in on CC, since Jeff, Palmer and I have discussed this on the
GCC patch review call.


On 7/24/26 7:53 AM, Florian Weimer wrote:
> What is the expected behavior if RISCV_HWPROBE_KEY_EXT_ENABLED is not
> supported?

Unknown keys are ignored by the kernel modulo that the unknown key value
is reset to -1.  This means we can safely pass RISCV_HWPROBE_KEY_EXT_ENABLED
to both old and new kernels.

Andy did look at possibly adding a new "flag" value, rather than a new "key",
but old kernels basically rejected the entire hwprobe call for unknown flag
values and so doing that would not be a userspace simplification.


> We only get a true userspace simplification over hwprobe + prctl if we
> can disable vector extension usage if the kernel does not support
> RISCV_HWPROBE_KEY_EXT_ENABLED (so a V usage regression for older
> kernels).  Otherwise we'd have to use the new approach and, as a
> fallback, the old combination of hwprobe and prctl.

Since the kernel ignores unknown keys, we do get a userspace simplification
over hwprobe + prctl.  The plan is for our GLIBC IFUNC resolvers to just have
one hwprobe call (as they do now) with RISCV_HWPROBE_KEY_EXT_ENABLED as the
first key and RISCV_HWPROBE_KEY_IMA_EXT_0 as the second key.

We also don't need to have any configure time checks in GLIBC to see whether
we can pass the new key to the kernel or not, we can just blindly pass it in.
On old kernels, we'll get the "extension is present" result for the key
RISCV_HWPROBE_KEY_IMA_EXT_0 we're currently getting now, while on new kernels,
we'll get the better "extension is enabled" result.


Peter



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
