Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E4DC41535
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 02:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6+1rPrzoJ2ZumG6DuxOclt0cKMQ3OucZHJpAPFQQc4w=; b=DReQAbv+Ti5v/n7qHk9ehHmKwD
	OXjsOh+E8x3M8asBkBB6n/Li/6m2nEo1zdup0YtLpKlUJJkV5UwwZUYPFRDYQE4HoSSO1yMjSCBuR
	vxNMZdUmm6V3STOQTJocg8KPqdfXLgxmrKq0PoN75GVzXHRk2VTFMk4A6Feo5ukDKo8ToxfeWi+eL
	AKU8pY3Y4P6pTz/J501tyF24WEldea6kzCOqRDPNPVWzHTM/TO4nBgzx0TtE+yv+zj30zuO261uT2
	1Xp7u3d+K3Jt0idIu8ogpu4MBBS9qZybVL8rWfyOLUu/scZMJR7fv/WCl0tfY9hZp3cVjlvlvmfI5
	SQqiBMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEgjV-0071U5-0z;
	Sun, 17 Dec 2023 02:18:21 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEgjS-0071Sh-2M
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 02:18:20 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6da5d410432so756869a34.2
        for <linux-riscv@lists.infradead.org>; Sat, 16 Dec 2023 18:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702779495; x=1703384295; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=OFl8kjpw91XelbaLp/NqZrQDKjPZSUtARdmSUPQXSX8=;
        b=HBMory5UWrPDJO0rra63pxBfvXpKeIocOfnoNUyY7NJ0pq8WFQvQWReTUuLn6SZKuC
         +LjCVc/T64+mUBucs51p+rgmA+nREzllNFSLo2s5spxIiC+mvM8nMkTI/QNGWrfmhyUt
         WihOcW1nRhB3WZLQHUcCiq9llnZrql9UXC87v+7q7pUNUrn04oJdsMQu9W7rpUphZ8DK
         wsLXdkJmJDmmGV6FAi2Pdiwrp6NgqEGEZiwEhDx0mBVX0xcPlLsnLhFWO+AewdnUEqWG
         DuoBwPyeh1a9in9W4SCvhGisk5owpMfFOY9K97NtBYt/jvIE1FJGk8pRBlayaATDNX+C
         6Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702779495; x=1703384295;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFl8kjpw91XelbaLp/NqZrQDKjPZSUtARdmSUPQXSX8=;
        b=R91wJVjgx0yRgi9VE4fIYYz4zhJuwTp8f+ypPvFF7ly4mzG1cmwVKMj35KITyyiptf
         Wfugz9juNe+lfrMnRrWf2Vw8EDsJR7Y5SiMg3IZm7RYlQ7dNEl5LJ6ggeH5RXfZCKnZa
         i766h1gDkfFjSlfEAkva57TaYMa5ZH1uq96osRjsmtPjoeyi//WpavYJIP6oqWVjFCMT
         T8LQ0wjh3gKUBxFQMzJU4h+GxvulMN+cb9+jVMqkJPYBPmVxS840Hvt+A4aBa59rGLxY
         SLztIsggpuHQaiGG4nZ0BoAQ2HAYu3sE01kpuaJdmSnM9gXYtxqr9CHASG47ARaW++HL
         aFJA==
X-Gm-Message-State: AOJu0Yxq1J0u1wPqwQxkC+KyLpidl3rABSgV8A1N0/EWflrFux4PyqFV
	2ijKoBXMBEv0BzjTE6QkL1HRtw==
X-Google-Smtp-Source: AGHT+IF+rykhjl/vJMlMFtG1M64I68Xtmq2p6wjQt8Jp7El542Y7P1lc23SbwSwdEGVtxnixp9/AeQ==
X-Received: by 2002:a05:6808:3a09:b0:3b9:e828:816 with SMTP id gr9-20020a0568083a0900b003b9e8280816mr20647236oib.48.1702779495498;
        Sat, 16 Dec 2023 18:18:15 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:a30f:cc0e:7239:16c3])
        by smtp.gmail.com with ESMTPSA id ja11-20020a170902efcb00b001d39f6edd54sm1453638plb.84.2023.12.16.18.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 18:18:14 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-34-201c483bd775@kernel.org>
 <875y1089i4.fsf@linaro.org>
 <485b6454-135c-4dd4-b38e-8fb8a02779cd@sirena.org.uk>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 34/39] kselftest/arm64: Add a GCS test program built
 with the system libc
In-reply-to: <485b6454-135c-4dd4-b38e-8fb8a02779cd@sirena.org.uk>
Date: Sat, 16 Dec 2023 23:18:13 -0300
Message-ID: <871qbl7esa.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_181818_767028_75361B5D 
X-CRM114-Status: GOOD (  12.49  )
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


Mark Brown <broonie@kernel.org> writes:

>> Also, it's strange that the tests defined after map_gcs.stack_overflow
>> don't run when I execute this test program. I'm doing:
>
>> $ ./run_kselftest.sh -t arm64:libc-gcs
>
>> I.e., these tests aren't being run in my FVP:
>
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, too_small)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_1)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_2)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_3)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_4)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_5)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_6)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_7)
>> > +TEST_F(map_invalid_gcs, do_map)
>> > +FIXTURE_VARIANT_ADD(invalid_mprotect, exec)
>> > +FIXTURE_VARIANT_ADD(invalid_mprotect, bti)
>> > +FIXTURE_VARIANT_ADD(invalid_mprotect, exec_bti)
>> > +TEST_F(invalid_mprotect, do_map)
>> > +TEST_F(invalid_mprotect, do_map_read)
>
> I'm seeing all of those appearing.  I'm not sure what to say there -
> that's all kselftest framework stuff, I'd expect the framework to say
> something about what it's doing if it decides to skip and I can't think
> why it would decide to skip.

Thanks. I'll poke some more to see if I can figure out what's going on.

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
