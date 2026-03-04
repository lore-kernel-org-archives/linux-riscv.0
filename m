Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C4CEDEC01
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 03:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+sH2y4i6BFsRtuC3ZbWkwiQAFfskjQ2qDybWwU+ueM=; b=Sjvw9TfKbUN8FV
	g9DASdiatJ5FFRhulAAJOjBqosfREfoKz9CJ+ZMCj34HpUwNsyeIAa/aelssi3DXAgmR2jbA9Qo3a
	iI+hOGKtoEnca5P6GH4g0BdbY4R4ovVkWZzW+S0x3c0XvPoSq2B7djbdTSdVmysHWdT+tMdyvXlzq
	l6IsItOIvzHHp/qrYCPD2BZPG5iCqlL7YmxeLftH3gSwQxRGx+akNpYr1UU+Y4SbAMT2MA6hRrwzG
	LbXSjRD9xTjScJB4vBXthiGxgV/Sg9hoWNfgm5TMIQeaOlPjQtSrq8Jo1VP0tzPlcFRX9CDp5l4KM
	qc53VYOgFZNhyjV0m6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd0w-0000000GNjE-49Ho;
	Wed, 04 Mar 2026 03:35:10 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd0u-0000000GNiG-0Igj
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 03:35:09 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7d18f80b5c2so4853004a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 19:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772595307; x=1773200107; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NrE0zI+7ilR1NedBJHHio8t27882PDymrHrpls6UPoo=;
        b=BaiT6pZ4zmrFxiyxw94lpsL7aywISFf2OUF/pF51oGdPLsWNPXHnute5xkW/cgZigV
         q6SIegkqr0jvA2QjyzoMPcFe2sg+fq7lr3Eq5JrDBU/qcDJFtjfFn1BxPUKCmWIq2+/Z
         VYo9nW4B2PGzPzUhxFiovrwp5RsQ+66L3AtaNAV5ASLxH0jK+qi654Yb3AVLX55nApm4
         yRqBUyjpQqNcnhUgCN62I/y1L0b/AIg4kUNv+83sKuXmfJxRmILPhwAG1yPateBMNouM
         0MwgkzZe39fBVPhbsvUKwn8619nn4rVzp/hIcYCxqJJPzb6hvUTER3LAKVAPHYvjAZ1L
         iRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772595307; x=1773200107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrE0zI+7ilR1NedBJHHio8t27882PDymrHrpls6UPoo=;
        b=jQgrtiSQB+C3OGt0oU44nQoGZVVk4qga8MbC7PGCDclVvVut2O/pmF48xSCt5pVdLo
         Y9RwlTNfrJ/6JwIcjPmgS/f7gG0zdTx8T8VhP+BxkpP2WsQwBrSq28wQxvOPnvIvRmH5
         MVyuxaGqmn2Hv1NiFG2B62j+bSjQBwjOOujQhHJP4j/l4izEQAC9Vj5gm1Mc08G9ApT1
         jyFRtZLts8i4InzKmPud8Xk5bq6QDY1HblY2jJk4vBEqORtAzfNljyGkyYvh9looozUd
         3KYxTGcL4WYonnwzaOgxn30AZm0WQiQ7q9MblmDWcK80pTR67XE6Jz21sv3d6AW6WcG+
         mHKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjaFDmV+Il396TKWiGgzNbU46uYlor01Pz+CRvyDv85bn+jH+mrwpxLLeKBeaD/nyjrOLiSj0G1kCVQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9LGzlPeto6YPDdNhGVE60jvtta+Iq2kfkEj1WV2Dg8CheYF7v
	ucSp9/Hzh+rHPZhw5U5mEkku5uiDQqtLc3t3dVfj4thvgOdXjI1mJUGFHliAx2uMuAs=
X-Gm-Gg: ATEYQzzgy8ihhNgy5s2yMUxET2/MwrY1B+2HQaSbDrErRduhh19Zjke0v3Yk7ysUbcd
	P1SybWASQ9QEYQztRC3kzJTCXqo5OKlvNjNLGWOFYhpL//o+71pyMNoKfKbLkQBiZnlcu0lU+zZ
	0DKwfj6WI51ww5WNtbtalmeldnhoH+2bQBEhSBxJ5wCkpX95XkXjcBZ16ue6t7x347K0yvUbWyv
	UyJgN2muDzjfJYTi2DtERMMXPETz3RQTxFbfOTRafZaIFBNLEGlFTieHcZGEht9muodmSikArYm
	7Lpvvn2uOKa4N4RQ3mjwQZYcKU+dgAuuFCTlQNAHS3f7384QCDFM4E0ep7gr6IK/E+v6AfSBMv1
	A3OXmokB5HH71e9jzpM4cy4Mx26qiURSh50xoEeKqQOpmnf0nypygZiRBJot1AqNzKma9KVuGrS
	byeNN9/k7WWKAbrFmKnverpxOBVA6KBE/kI5aN/wCQehKZEp3hu7IoG14I+Z0yjivU4u2tB7UqL
	ydb/LcCyg==
X-Received: by 2002:a05:6830:6185:b0:7c7:6977:17cb with SMTP id 46e09a7af769-7d6d139f788mr450044a34.21.1772595307034;
        Tue, 03 Mar 2026 19:35:07 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586653f6asm15202012a34.19.2026.03.03.19.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 19:35:06 -0800 (PST)
Message-ID: <e96e851a-9050-4d8c-b1e5-bc3b5d91a84c@kernel.dk>
Date: Tue, 3 Mar 2026 20:35:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] mm: globalize rest_of_page() macro
To: Yury Norov <ynorov@nvidia.com>, Sean Christopherson <seanjc@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Duyck <alexanderduyck@fb.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Anna Schumaker <anna@kernel.org>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Aswin Karuvally <aswin@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Carlos Maiolino <cem@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Chao Yu <chao@kernel.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@gmail.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dongsheng Yang <dongsheng.yang@linux.dev>, Eric Dumazet
 <edumazet@google.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Janosch Frank <frankja@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Latchesar Ionkov <lucho@ionkov.net>, Linus Walleij <linusw@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Miklos Szeredi <miklos@szeredi.hu>,
 Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@kernel.org>,
 Trond Myklebust <trondmy@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, Zheng Gu <cengku@gmail.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-block@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dm-devel@lists.linux.dev, netdev@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-crypto@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, v9fs@lists.linux.dev,
 virtualization@lists.linux.dev, linux-sound@vger.kernel.org
References: <20260304012717.201797-1-ynorov@nvidia.com>
 <20260303182845.250bb2de@kernel.org>
 <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
 <aaedwFwXh9QXS3Ju@google.com> <aaen2pGs0UeiJqz1@yury>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aaen2pGs0UeiJqz1@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_193508_125983_6DCD8642 
X-CRM114-Status: GOOD (  14.29  )
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

On 3/3/26 8:32 PM, Yury Norov wrote:
> My motivation is that it helps to simplify constructions like this:
> 
> -               loff_t cmp_len = min(PAGE_SIZE - offset_in_page(srcoff),
> -                                    PAGE_SIZE - offset_in_page(dstoff));
> +               loff_t cmp_len = min(rest_of_page(srcoff), rest_of_page(dstoff));
> 
> Or this:
> 
> -               if (folio_test_highmem(dst_folio) &&
> -                   chunk > PAGE_SIZE - offset_in_page(dst_off))
> -                       chunk = PAGE_SIZE - offset_in_page(dst_off);
> -               if (folio_test_highmem(src_folio) &&
> -                   chunk > PAGE_SIZE - offset_in_page(src_off))
> -                       chunk = PAGE_SIZE - offset_in_page(src_off);
> +               if (folio_test_highmem(dst_folio) && chunk > rest_of_page(dst_off))
> +                       chunk = rest_of_page(dst_off);
> +               if (folio_test_highmem(src_folio) && chunk > rest_of_page(src_off))
> +                       chunk = rest_of_page(src_off);
> 
> To a point where I don't have to use my brains to decode them. I agree
> it's an easy math. It's just too bulky to my (and 9p guys too) taste.

The thing is, now I have to go lookup what on earth rest_of_page() does,
whereas PAGE_SIZE - offset_in_page(page) is immediately obvious. It's a
classic case of "oh let's add this helper to simplify things" which
really just makes it worse, because now you have to jump to the
definition of rest_of_page().

IOW, just no.

-- 
Jens Axboe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
