Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D884CCF9FA
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 11:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzQGUeC5pE5y4SJzP905Q7Us14/l4d14IcxC+ixj5T0=; b=AOUieovLbNQw0T
	/XXe99KdsPwzXVGl0xeim9u113cOKPwOwJie7bWBij1peEX53okw8BAE3oLsU1v2G59Czm8uAGpQx
	ck/VlVtRyMB7JhIE6o75rV3NeCekJx+6lGrqE+taUvH8ec1pSnWtFkUiZPOxR4wwWKgNM/cc+6alF
	6tCPP9oFETe3NGZzS1badi8tO0vx96X37t9i+IlLCseqHapgpxO3YZMliyMoD4kdUDFT6Uji2iZ4Q
	hjLY3l3bA/AGRXAKKKq3RLhZTWj/L1pVPqsLeCY5uEOiV2ctxuNKeHjUtufJ4OaSCa0vn7Pt7xceA
	ItQ8GKZxxgbwrDGnqx3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEngq-000000062PE-3898;
	Fri, 31 Oct 2025 11:53:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEngn-000000062OR-0Yll
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 11:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761911584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gTUIS93GUZsQyg4tbyddEkDWsI2/kBv/P3HZONFfij8=;
	b=ZlOCAo2r8WDUbYCJ2P/pGlNKi08cOyyD+OlDtc70Xg66QGeNdSWUMA+Tkz5E+WAlVJU2Yt
	sW49SKzQ4qibUpmwwZyjwdw6oPMLyrpiCrZj1h3z8Fj86jxyjl88yY6o4dWETwFVb18Jqu
	Onhzc73iYXIwP7Y1rhHsAzaVv1D8Na0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-aPZrNWPlNm6kJhEHp1fFpw-1; Fri, 31 Oct 2025 07:53:00 -0400
X-MC-Unique: aPZrNWPlNm6kJhEHp1fFpw-1
X-Mimecast-MFC-AGG-ID: aPZrNWPlNm6kJhEHp1fFpw_1761911579
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-426feed0016so1245276f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 04:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911579; x=1762516379;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gTUIS93GUZsQyg4tbyddEkDWsI2/kBv/P3HZONFfij8=;
        b=W9foDcWVOBBLDe5I+zHOcmUqkErk8OmxNdMkIB4ltBiKYOBUYXnMNllaRH5w9EQKC8
         eOnpMKvNEceEVbkLRgbmuBhD3ct4e6emvMDcB8YODG7IY1+2zgTC0Yjsl1OiTapnJ7VQ
         41roYSdEZp95imv/GcL8fDh4lt24OzXi0OEyS0QogjoV7tyoloq1mX1kgR6YV+dP1CLJ
         7xlGsGPFj634Zbt3lwTqEiPp8/hSWNJ0u3SN8rHfp9pzGg1uAMe7oajMy7mOP+52tXL8
         qZeQOiw2gTJYkDL0KMr1xVzcq/w2Spyx6XfDVyX7w7HXsF5kCf62g5+ZwxXf6TGO/Svm
         x3tw==
X-Forwarded-Encrypted: i=1; AJvYcCWeYJ+tXKu0mJbDnwqIGvlMMkby9nnCJnSAtyAQRQMDOeWAa4TOGM16V/4fVTbVrqGlyQHrrWSi22ZlTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLI8lkl4LAQw0EBv+HHDMNoWc3Gjqf0iuH8HLokB5in+zFQ7Mq
	lCk/u+Xv+oXT8zm3bwyow7So/Pzkf3h8iYiwnhbC7G86tj8icHNlxzAQlup2XYStpi21+f/M6Dq
	cSCCH/QIBLyohQL4FNN5JUAm4/FMuW7VuLyokhW5L3A5hgIeYJ2l8B97zTp7TKucWXF0bSA==
X-Gm-Gg: ASbGncv++yaS0PkWUYFny/uCmWy99Qw3ZKSmaXs9Jbsm8WeUbYlqplsDL9NswnfKAzr
	rgUQJKU2GKNoLKix5xZMf5dTBSGQ+8/Flic2VmZA+7OpvCdxrD//opYfGnYgtZ4p6jFIvYaakM4
	WBxjal3Gv9+i50KvU80sLTz3ST5PGF4cyyFatvAyAyeaLQOZsatDgAgnXdZtCmDta7IevVLVjVC
	uu4+WkgM8yQdni+tSTNbT4v4/49uNqHvHjGpW4P44GxE5PzcMfP+vXLTcp0riOEK3Iq0Xf/ihUt
	L3U0Z4hUh6wqSyZp6weubPNVUVe4BSqdU0z+/laFy7n0m6kw5lFc0advuxM0w/C8iVGzYJSrcvG
	Beeheq2BRTQgtzh7zItQC8ZoDV4jfkiVsrsEDxAFxdSzZmsPgMg1HY1XhNrfC
X-Received: by 2002:a5d:5888:0:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-429bd676a88mr2912825f8f.10.1761911579328;
        Fri, 31 Oct 2025 04:52:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1wuetlLZ34asXy13r1bfmujThSOSUu3cZmMHhgfxqrER8G1YsbbHDsXHGv7ziQ36i83pqkg==
X-Received: by 2002:a5d:5888:0:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-429bd676a88mr2912761f8f.10.1761911578857;
        Fri, 31 Oct 2025 04:52:58 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1142e7dsm3186896f8f.17.2025.10.31.04.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:52:58 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Petr Tesarik <ptesarik@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Josh
 Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S.
 Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn
 <jannh@google.com>, Dan Carpenter <dan.carpenter@linaro.org>, Oleg
 Nesterov <oleg@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Clark
 Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Daniel Wagner <dwagner@suse.de>
Subject: Re: [PATCH v6 06/29] static_call: Add read-only-after-init static
 calls
In-Reply-To: <20251030112251.5afcf9ed@mordecai>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-7-vschneid@redhat.com>
 <20251030112251.5afcf9ed@mordecai>
Date: Fri, 31 Oct 2025 12:52:56 +0100
Message-ID: <xhsmhqzujp9t3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AXVh8HS5xFe71AwhoSQsvXAsij0BQZJY8abjszEBHvE_1761911579
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_045305_239635_1928F9CB 
X-CRM114-Status: GOOD (  27.80  )
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

On 30/10/25 11:25, Petr Tesarik wrote:
> On Fri, 10 Oct 2025 17:38:16 +0200
> Valentin Schneider <vschneid@redhat.com> wrote:
>
>> From: Josh Poimboeuf <jpoimboe@kernel.org>
>>
>> Deferring a code patching IPI is unsafe if the patched code is in a
>> noinstr region.  In that case the text poke code must trigger an
>> immediate IPI to all CPUs, which can rudely interrupt an isolated NO_HZ
>> CPU running in userspace.
>>
>> If a noinstr static call only needs to be patched during boot, its key
>> can be made ro-after-init to ensure it will never be patched at runtime.
>>
>> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
>> ---
>>  include/linux/static_call.h | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/include/linux/static_call.h b/include/linux/static_call.h
>> index 78a77a4ae0ea8..ea6ca57e2a829 100644
>> --- a/include/linux/static_call.h
>> +++ b/include/linux/static_call.h
>> @@ -192,6 +192,14 @@ extern long __static_call_return0(void);
>>      };								\
>>      ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
>>
>> +#define DEFINE_STATIC_CALL_RO(name, _func)				\
>> +	DECLARE_STATIC_CALL(name, _func);				\
>> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
>> +		.func = _func,						\
>> +		.type = 1,						\
>> +	};								\
>> +	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
>> +
>>  #define DEFINE_STATIC_CALL_NULL(name, _func)				\
>>      DECLARE_STATIC_CALL(name, _func);				\
>>      struct static_call_key STATIC_CALL_KEY(name) = {		\
>> @@ -200,6 +208,14 @@ extern long __static_call_return0(void);
>>      };								\
>>      ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
>>
>> +#define DEFINE_STATIC_CALL_NULL_RO(name, _func)				\
>> +	DECLARE_STATIC_CALL(name, _func);				\
>> +	struct static_call_key __ro_after_init STATIC_CALL_KEY(name) = {\
>> +		.func = NULL,						\
>> +		.type = 1,						\
>> +	};								\
>> +	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
>> +
>
> I think it would be a good idea to add a comment describing when these
> macros are supposed to be used, similar to the explanation you wrote for
> the _NOINSTR variants. Just to provide a clue for people adding a new
> static key in the future, because the commit message may become a bit
> hard to find if there are a few cleanup patches on top.
>

I was about to write such a comment but I had another take; The _NOINSTR
static key helpers are special and only relevant to IPI deferral; whereas
the _RO helpers actually change the backing storage for the keys and as a
bonus are used by the IPI deferral instrumentation.

IMO it's the same here for the static calls, it makes sense to mark the
relevant ones as _RO regardless of IPI deferral.

I could however add a comment to ANNOTATE_NOINSTR_ALLOWED() itself,
something like:

```
/*
 * This is used to tell objtool that a given static key is safe to be used
 * within .noinstr code, and it doesn't need to generate a warning about it.
 *
 * For more information, see tools/objtool/Documentation/objtool.txt,
 * "non-RO static key usage in noinstr code"
 */
#define ANNOTATE_NOINSTR_ALLOWED(key) __ANNOTATE_NOINSTR_ALLOWED(key)
```

> Just my two cents,
> Petr T


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
