Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C69606A329
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EC70/Upy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ELVJJtzR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=stBNRqAaJwTGmHEpbueLa6bxAUe789fjagsUDPylR04=; b=EC70/Upy1PvSxaiNCC6+emOk10
	fpxRxSXEbKRuQkcAPyzzyVQfl2sjPXeL86+mchiJ45oPTpYxta4tw4ie8yotzruGB/hPQXwmH8/ZZ
	lAwcHq/SUu7lkHdyTNOFqfddnIsXdy45cU6OeYLoowAs+87AXD7N0O6mn4x4HKkM7HuR4+JWxPtWP
	Vf96Fvin70WjDvbPsI/K+ABKKi2tznJTDvgiX1XAdKPL7POFY+N4oHgLOjlc0Ji1W1RcLmq5hwL+v
	k9WGSelF/JR2r5JfpXTZRK0sXNjtyRZxEwEVoNwi9wxjLy6V3owvmKaQDqOnfbzGgdvVI56UQqsdg
	35la8mJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIzD-00000005rw4-1t52;
	Tue, 17 Nov 2026 13:12:35 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIzA-00000005ru7-1erX
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 13:12:33 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2371266f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 05:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794921150; x=1795525950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G4E5w3vIfYrEz/focXkw7N0ugWTu4zF6SufD8ZnoE6g=;
        b=ELVJJtzRc2EVK3ymiqeyBLW+Pwapxvc/8TiUAiIrm7txnwgPSNLGm4rAg0aZaH4RKl
         CTAmNFhgtmOlsLTlkOF9tYM0bUtJJDhgZsI1m2L5mTrWyV4HJ1T/XhXru4yzaAhCQmec
         T+chT+YFhM0CswcAZ/ycVp1X7JdrplzUlVdjer/08BCKCJNtzqGZBabjCcI6ba7YrPB8
         fEuTJOxRI0f5euFPgLBhqNOXRnmjCHprDxEOePDPLrJnnlmoxy8btisMJUZKV9Ndzsd8
         gbOfT1z1KCPt4rbXhFm/UEltIjyCndHKE11ZJkC3L8nBHiF8V+rOcI0mbbLf5IIiOU+Z
         yeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921150; x=1795525950;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4E5w3vIfYrEz/focXkw7N0ugWTu4zF6SufD8ZnoE6g=;
        b=1i8yqnm4/JzRm8t6CHoviBlATqk6DZZbwi6Cx+7W4l+PrAmYv4sp7jn7Wd1vnKJPDG
         zJ7yOGJ2x1B5DcjwAbMrjLse8Eu2YWHVIuP6YAtSixNBXEHzDr3EKKuXmBeABGVK6SO/
         rJlfQTss0WJdQApy3PTAdAozD/W5WX98jOC8rjaNCNTddAmNY9ulh1tdCqeSRJ9mmmL9
         N4r/F+S6XofOfjQ4SSB9D3pO5tcDXgkaM7FAFDJhckZFK+aWlJgoJHSTtuST4YdMolYf
         MPeJiIleXLTTFXVj3RHf/O+fIx9tmYq6F/MhYMQKx9cMfCqc7wKq77ReVAZNcfXp5FJE
         /1xQ==
X-Forwarded-Encrypted: i=1; AL+hErEMPa/ws3j+hQjH2IVoOHQ1UnuVJ5XTBPhfwsZQYXWOF383dsnImDm2ELThZ0yCZvpubXa+I0Z/A28M4g==@lists.infradead.org
X-Gm-Message-State: APuU4Z/6CHq4TeIATrvhUUoctxcjANGjnEKSETg8FdZino99uxZs52ta
	3uXzVdCRY4eYnvi3fCsZIU4phvhU884ySj2PMs11UupRqVaYczdzikDO
X-Gm-Gg: AZFdTZdXl7bjHSxaNK6cjL4JmxPjsTa3k/A3SP0PqN7ldBVkPCzwig3IoWspaG0nbDa
	Qvj5/aPJPEymdtcLrZGAZOilEdY8ck7xurQDJjlCOdq0th3qlqPc8uUPCQf/Vl5Bxy9gzb+jg7l
	UFveVzpr/eibR6LJQxvxWBcWYxcPSWWoyI21b8DBhjhSkMzbEx0G94V0Un38PL4E0OBFQ+Ja0Wd
	ppaKPolU4nqBQ7RtLhmJQ9WYs1k2oEm/zRwN7EXY5fpFJzjPuP0iN6FhScfWvBq94Oy+baaFa6w
	w+oVjjjZDQV/hijVgyz8QvduzzLFJTI8tkTIRN06FPe4XzeLP0kuROKXc+aj+x2dbJn96yuw21O
	jBlKygHmovFH0HvMYZCWlzkYwt4dKkIAaV4j8gFbLifRM/00BoiKr9ORe6Xq32Lppl8ctQi9iAr
	HdyoIxDzWRkTiwnipCZVTE+3PT+DQ82ih3IwUQ4ZzK4pIjOODjXO5pZthbuCbYIuB3vu8c9MDDk
	kCxCFoOlP6IWy+40h9u4BWyi1DNbkrLQnDV+ce3XjdXWThnlYQYYyFZ6z8niZ796PFEMipkZA8A
	8IUKfim6buyl8Cj2UxDS3lQnGC7XLa5bfPj4NHTYc5EBJAyBOh4Zqk2vmLZvFmF0ag==
X-Received: by 2002:a05:6000:178e:b0:490:ae2:b841 with SMTP id ffacd0b85a97d-49c73a05d9amr29331087f8f.30.1794921149776;
        Tue, 17 Nov 2026 05:12:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c81a63b1csm26732407f8f.4.2026.11.17.05.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:12:29 -0800 (PST)
Date: Tue, 17 Nov 2026 13:12:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Shuah
 Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Yeting Kuo
 <yeting.kuo@sifive.com>
Subject: Re: [PATCH 0/2] riscv: Add support for vector misaligned load/store
Message-ID: <20261117131227.3919c5bd@pumpkin>
In-Reply-To: <20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com>
References: <20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_051232_457962_CF3898F1 
X-CRM114-Status: GOOD (  13.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026 23:38:36 -0800
Nylon Chen <nylon.chen@sifive.com> wrote:

> This series adds emulation support for misaligned RISC-V vector
> load/store instructions, which may currently fault/trap without being
> handled on hardware that does not provide misaligned vector memory
> access support.
> 
> Patch 1 implements the trap handler, with emulators for vector
> load/store covering unit-stride, strided, indexed (ordered and
> unordered), segment, whole-register, and fault-only-first forms, for
> both user and kernel mode traps.

I'd have thought that the cost of emulation would so high that you
really don't want to be doing it at all.
I guess you can't stop userspace (they'll just wonder why their optimised
vector functions perform so badly), but I cant see any reason for fixing
up faults in kernel space.

David

> 
> Patch 2 adds a kselftest exercising these code paths across the
> various vector instruction forms and element widths.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
