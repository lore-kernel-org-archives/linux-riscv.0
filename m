Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80991C56205
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQoqEYclldhMOXZg2/deWcN3NYVBXMAt0EBMoRNGbtY=; b=d4falTNpRn9ILJ
	D/T2XJkqe5GpLl5i5rzSFEldYUbGsF255stdEoEXJl4GdUCIWam1RZzA7HZlzIW9ZpORMdr0D0JKF
	t25/iu1q+UIPGi/liLs++ZEyFTNesKfWt9MpSTJJqBsSOgmWVxAYFhNLHUHHK/tMqGJIZ1iZZYdxB
	8Cz171icr/sZPp895g/Y7pLISQXpxTOOOCEiNesGhUYvG4fMATFsHE1Rwc/RgqfClD6Mn/+R6Qqmc
	dJru+GCca9m46gH/wZLnMyjvzpLM8gLqeAHU+/CINszxe6D/43YaCiIfWjtQgHf5PymiDgS6ZO0V1
	NfUcNfBDLOqiKXtoNMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1ae-00000006Jxd-1pIu;
	Thu, 06 Aug 2026 17:09:08 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1ab-00000006JxE-1IT5
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 17:09:06 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-43bf9548df4so1587002fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786036143; x=1786640943; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLsWRBhfzXCtfwMjhcYY+QYQpCsTl2+rExgA5K9laCM=;
        b=YYllx5D6CRfTO+euBUh4YnBBJa2XptxIy2aGQ9UBZSRTQvdtMKbx8nkHRfu+FxY3JT
         hIdAuJFsnA8vMJBrzPY24hAUXz0dLJy7GrRkFlB+QzMmlOfxqeEIYq5XS2T0g96Q1ixl
         ke4zZy+3S9ytO+72Dbk/sYCW+2+UqT3C7yvx6OTMcwSMoeEUqXg7IvSHECslHlNr9owB
         nlQ70IFoXBig/kxLhrwsHRDHRrvzCcEtOfEaPpvsfmghT+stX9tJtG4sXxqbeqNnSXMh
         +RgQiiirO9vBJZJjGDVBYMS3WEOSNM3BfD37NKQ8Dyx7ffq5GX6rgGkRmsOUb3qZ9+nc
         huAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786036143; x=1786640943;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLsWRBhfzXCtfwMjhcYY+QYQpCsTl2+rExgA5K9laCM=;
        b=dY2BdnKz4YLR6QKPpmSxt+e+VQoBuYzRazpxg1Do1CsUwM1uzCIpyQRhaklO7sEtFp
         uQzTyhvLDJ+zeJ7fLNmHRh71badfSB+shRhcPF7NyYySxBXVncXHdn2VqJlhXHxAfH0A
         FFGZMy/glsjPXKZW6ZPv/Qlzj+/f2RPjZfJsdmKeBVFIJ8ocxtQn2X708Av7htSlpX8g
         HteaVcVfRYj/fjer0tOcUkvlMumkOWM7T8l6g6ZG3IURdktLeWk/ySDTJLG2IF8+ZVAg
         xcQDrdl/IUlww06H0Ior8lEjkON8rpo+eaCxY2p0y6N+QB4k6AyS1xP0D5f3i4NWZM0h
         uHPA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5pX2ejmf+Dk0unc/5A7VdcLwsllRInSwQWS7gy6Z0vNHav7CBXPXGAULR7PZpMDP53RqLVbgR3d921g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3rGvcDFYw4tr/cyGzOkGT4YklhrFyLlId5OOnigO1fc0qKjOW
	YHnYUL2dK5co3crJYgTToC7UsS3ED3oFgva2OLdBTO6ezLkP/JvgPx18flRa9I2ibjs=
X-Gm-Gg: AR+sD11zYv3fojxnSjrVjUAx1GySW9ZQxpxwS6qTMAKo1RLzREXrYnKtEmegNfR9Cgm
	Cb0Qgb1kGgYf5mKbmvEjerAVjsvxT7Qunu3ZKK8YynToAN6FOSeRd4zANW3RJQB1bqpuOi5Fjmx
	hqRCRS7Jl6mRB7EsRF2FR/YWtt3n+vBLw0P3Z7rBekqZGUKUFEZgfDguw8hAohkEG2hdgzK70f7
	16LdRMUn1liYcPyE2YAXFJ4sBFYlfG+inrveSXF+yV1ifV60uaWWrNzI8Nv9j4nOLzZFumlYOJj
	IgnZ+SBBQSaRQhY5AmC/eHgb7Q0+hXkBB4wHWT1VsOmoQgD5qFe6lqTIeo96UvCTeMT5R0iirKI
	+FKF5icPg4qx2MbFzPcl7HKNQQUkHTEJvh9eiNmqvERfRXSUZC/jklZrV7oBPOBPSXK4gX1qRyy
	cszYuttHyMsqT713v7FRAZnVuTxumhBIpZj7GXO2p98T1hc7/e8R1HIGfuCqa3oc06ovYmJD3s+
	wvKP/9ABehnZ3oPuAZZ+RLu1M0=
X-Received: by 2002:a05:6820:1519:b0:6aa:edca:e171 with SMTP id 006d021491bc7-6ae96ec790cmr7787359eaf.19.1786036143494;
        Thu, 06 Aug 2026 10:09:03 -0700 (PDT)
Received: from [192.168.86.29] ([47.232.46.70])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae93d9aec6sm6272448eaf.8.2026.08.06.10.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 10:09:02 -0700 (PDT)
Message-ID: <d889d09d-951e-4414-95bb-625bcab7af9b@oss.tenstorrent.com>
Date: Thu, 6 Aug 2026 12:09:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: hwprobe: export the availability of vector to
 user
To: Florian Weimer <fweimer@redhat.com>
Cc: Andy Chiu <tchiu@tenstorrent.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, kito.cheng@sifive.com,
 dfustini@oss.tenstorrent.com, greentime.hu@sifive.com,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
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
 <cc671848-f954-41bf-b7a9-ba34c29593ec@oss.tenstorrent.com>
 <lhuik5n4v57.fsf@oldenburg.str.redhat.com>
From: Peter Bergner <bergner@oss.tenstorrent.com>
Content-Language: en-US
In-Reply-To: <lhuik5n4v57.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_100905_486936_B766A98A 
X-CRM114-Status: GOOD (  10.78  )
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

On 8/6/26 1:31 AM, Florian Weimer wrote:
> 
> And if RISCV_HWPROBE_KEY_IMA_EXT_0 comes back at -1, we'd turn on V
> unconditionally?

No.  The unknown key (RISCV_HWPROBE_KEY_IMA_EXT_0 in this case) field would
be reset to -1, but the value field (which is what we test for the presence
of V and other extensions in the resolver) is set to 0, so we would not enable
any ifuncs in that case.

In the "new" case we're discussing, we'll pass RISCV_HWPROBE_KEY_EXT_ENABLED
and RISCV_HWPROBE_KEY_IMA_EXT_0 to hwprobe.  For kernels that don't know about
either key, both key fields will be reset to -1 and their value fields set to 0.
No bugs in this case.

For kernels that know about RISCV_HWPROBE_KEY_IMA_EXT_0, but not the new key
RISCV_HWPROBE_KEY_EXT_ENABLED, the key field holding RISCV_HWPROBE_KEY_EXT_ENABLED
will be reset to -1 and its value field set to 0, while the value field
associated with RISCV_HWPROBE_KEY_IMA_EXT_0 will be set to the "extension is
present" value.  This still suffers from the (already existing) we'll enable V
ifuncs issue you mentioned if prctl was used to disable V, but as you say,
it will be fixed with a kernel upgrade.

For "new" kernels that know about both keys, the value field associated with
RISCV_HWPROBE_KEY_IMA_EXT_0 key will be set to the "extension is enabled" value.

Peter



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
