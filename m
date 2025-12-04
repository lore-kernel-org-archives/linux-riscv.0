Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE90DD1F9D3
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 12:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbZWx/5eTBfO360HnagDs+yaMgWeRG5dWWZWLy2K4cc=; b=dOXotoNthP18PAkYwAtkYknmfi
	LlD1i5oi3q8IYCatIkxx/K4RTSJSmQyM0W9by0TOOlaB0QEdSADLge6UT4C/Qb+x7S5/fYQHe4ZfT
	2qssV+BxnpT7CM6Queaek3LQH6PZxnOIv7HTDQvkMYC5utYyfoFNg5SwwfNC7sSAu5ke/Meh9HEfA
	PnQzwL0l48zFjx2dOBQRVa03hn7YB2RBh5yqaiQD9VqI6KfsN1JNBpTowkiEIwKPg8inaDthhn5Uq
	wVo5bRS3tcRotK/9GkWbZgxe6mhiaJSyi5IyHErhCzZYv/xcv42RDeA59XrEZTQoX5OekQUT/8SUV
	B5FkZe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8Wd-00000007zZp-0si6;
	Thu, 04 Dec 2025 12:33:35 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8Wa-00000007zZP-2wCq
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 12:33:33 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-78a835353e4so9273797b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 04:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764851611; x=1765456411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LSBGLPlqRHWA6FHsfup0TF1aoJUDnhVkqy0ECtK4a0=;
        b=ALegc3bG9hdnhNUM06lUdQuyCt41VqX4XdrkyYvONsBpZXjHrOVAdrKGqImbdLLSB3
         RMbotpxPuADLXCrSfVCzoDPaIxEcZKJTUdUlGm8D425Z12fwpJeQBhMT1hgkqHXu1g6i
         g1m5Y72AzJqF0QqBYKCS7CiyJEpADTexb2OX6+lNXAaQmIqp/16zgm1DtLO5WMOPtX+o
         OvVcrHR3ubR54288KnceJjd7Qw7mvmpM4mQ8zQFycX3ikSVRKjAmz+tbwgqo0AnzvBDD
         9yKGrLbBdyjUMpSJZh7TPgnmvuJIWWULJYHLCszNUjXSUO5WweoykLVjIIaz2vL4COFr
         5Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851611; x=1765456411;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LSBGLPlqRHWA6FHsfup0TF1aoJUDnhVkqy0ECtK4a0=;
        b=h2ylf8bL8FTUXSK8rKw2eg0Cu646mV0E50FhSPXPlmZAXrLucSDYi+Sb1XbW58jhYB
         8S7ysDcbxMI6ZktJr54edS8M3J5g9tSxS57KD6yH6W0HjjVi567/El3oxzc8ryuJ4ooU
         iAlUBvN+UhAFS8kHGTzgaNmxw7M2LQmo/61F1sb8GquGnyzGUEpqtKgTeWg2qkrrjPg2
         Jm+gcDnvhPtl19ArtVw89vJWp9Ykx5jmgidUybJPiSW+j5T1VMxb2QUati8+cjp86G4h
         ghkkVxrJLgZG+jaAb8azZHMH/37C3a9js/dhMf/0TREDzaFSc3XbJ+T6ZUoeHyWxSZbd
         sZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0CwdEk/baQmNM+WnQMXFngrFdIoLqfFOJ/0AEeH5b5VyN/8mIyAC3rGNzALM3Qjj40AfUJuyDIl2Q2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf39N4xCgw0d9wbhmjDEF+usAxl2qg1Jotb+aGTHFKRF1015I5
	J70fwpwf7u3p/IvgPhg1abuDvouJQXkbQxfi97pCrncLlrShJO0K66pE
X-Gm-Gg: ASbGncsBMqYaF3B7VpiiD0bHcrj6fQGt5OsHnRSU+0HHWeR3yfZ+PezWcddKvR53VP1
	sZsRtg7enaObKUZ1kGa7SsBmhPIIkeA1hIR7t9u3WbncmN7rpzhriDJM0pZXEJVhhh77Yh7CaA7
	HBIXR0jHV/tz8eAu1umRcRpapoTdc7HmxEvdaJ1PyocDvsrXxBJJ1WQ3tiObaRWp3F2kJhLNZsd
	xlaBi4k15YIYfin6tiTuKbZeaMph/J68vWS9Kwu0sdvjEbwXGfvgLSCyqoEbiEOUy57dt46UMMr
	PqAksrSWJvisAq9jE+AdyUzX44GKF0B8CzXZP23D1YTaVA1KFOWWntWs9uMO/xsanYyUyfML7bC
	r2V0nxqYWxsh/K2+9/mtUPx4zPo3pyd8kAjtAk40oKyma/OF1d+8rf4hyLSYmkGPS7N4x5+K4nO
	ctbSQFziH77nHS037yUykVZYNP8SmNPrByQOrwoKQD0mnu2r61BZw=
X-Google-Smtp-Source: AGHT+IHBUEbYkxJaVsA/zBTgJe8/H/sEcBnHGISwxVU3+cajLhUyQv9YXSpqaHkdOjyO4eiZ0/Xsyg==
X-Received: by 2002:a05:690c:6c0c:b0:78a:6dc9:8801 with SMTP id 00721157ae682-78c0c285f98mr45923627b3.51.1764851611217;
        Thu, 04 Dec 2025 04:33:31 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4d22bbsm4914897b3.21.2025.12.04.04.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 04:33:30 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
Date: Thu, 4 Dec 2025 20:33:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
 <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_043332_749261_BA9E9849 
X-CRM114-Status: UNSURE (   8.18  )
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

On 12/4/25 5:06 PM, Vivian Wang wrote:

>> +
>> +# $(bindgen-backend-option,<flag>)
>> +# Return y if bindgen backend supports <flag>, n otherwise
>> +# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
>> +bindgen-backend-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; $(BINDGEN) .tmp_$$.h -- --target=$(BINDGEN_TARGET) $(1))
>>
> Can probably be simplified down to:
> 
> $(BINDGEN) /dev/null -- -x c --target=$(BINDGEN_TARGET) $(1)
> 

bindgen is sensitive to file extensions. If the file is not .h or .hpp, 
it complains:

panicked at bindgen/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
