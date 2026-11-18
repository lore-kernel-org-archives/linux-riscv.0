Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7771D606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wT2hjtu2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PxmEZLOs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=deEWroZ/Zl8VrBJ36rzn5sFmXMhTpp/UMlNSGPniUS8=; b=wT2hjtu2gASRVFRPhwCRRFBkZ0
	qHpRC2Lfco6TbTxJwulJp1pfgNtTRrhb709L0L+h3WvK6MXQIRY9FfzMwgtUqSblm8cx3NCoNoyrd
	mvbuMpgUVScF2PFaQH6wBtoexQjYhwNuwa8SlHc9LFd+MqyK2wTZAxLqp34akl1DsgowtllBX29Ar
	V7uJihIL/6nhYK7B6O19SdeePnIGTfno8GJplMLurdOOmFV8SkZ/OzHqnKqXa+eTgL2aFKBkPCfkI
	NWYkaLMQeeeNGRY6oJXAfIPct0RSXcETJGHHoV0XtuUHih3HfSjqTof/vfH/pF1FjFBfdVw1ofPyh
	YL3XuiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg0x-00000008zh8-0xXQ;
	Wed, 18 Nov 2026 13:47:55 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg0t-00000008zgF-1UrF
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 13:47:52 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-4a82fb7e71eso180248f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 05:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009669; x=1795614469; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbHSrCrWbtManjiZm8yvLdlzikeM8PecjfjtsmyrzGk=;
        b=PxmEZLOsZAD0RJlXUprOU4D1BX/Lf3oJB+kPrKGzJz+aHmU45tfykL9rgd9Dxi5dLi
         MapRn8VqPpxDlenrV/tgsKhkHsZfnIf1EVNf/alqAoPaZCCxycuR/OAwy0/g/+yFbJIj
         Sp+nP2sSk+UpsG0m0TfBOqPnoY3Y+GzxNKC3M1udxoXmOd4tORWPUne+AhT6LfnBsyIZ
         4gfzqvE5E8RhgPwD61bBg0NTr7KkjIf4ksUD00LBDlQiesBhIAs0EL09TZdi/EccHqiZ
         E8etJFuGlR7ipnn2A7fVETDnXo+Ef7yfeRlOIi7pouZIrN+Z5+VPH9npwMjJ2ZZNfdlj
         1eGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009669; x=1795614469;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tbHSrCrWbtManjiZm8yvLdlzikeM8PecjfjtsmyrzGk=;
        b=zxaemnHdiWiXcWZ6jvxrXB62pci21dc61+CZ+ZHZpsCNoHh7Z0gM5BvQ4d6dBXS7nJ
         7xPjY8thyvE+PRjRCOkBKM0k1pjVp5NmlxgdfbCqRaQ7AiKIec9GpOYrJOZiq9oxx1gv
         c6VqLhOjCLyDjOhF9iVmh6wyJKUFVllC26Zv9LehfWRrJ4szn3PoC0y9vutxkaejevd2
         8VPUgLVYXbik76tgF08UW1HzpkLB5cDUosRWbqr0sLP+pHqM/k6FYePuy0tWRgqBR+zE
         8YMldkQHf1FaqQ9ouaM5NNtrkyXbwMAfwg4A0cZAHiEiGlxtT3qzIODubdXIiwKSn6w1
         OSDg==
X-Forwarded-Encrypted: i=1; AL+hErGUvWusfNniH96sjjYrxhih+3Rutl4DYjb7HBbsQ9uwxYQuNqGa/LnuBKe5dsC6yI2k/LsN4ZbYhMpsFg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/lAGmZGD2J1Xema/jVJ2qz0/XYxuRnUmR9wFnw3h1ONW8iR72l
	JW/vkeEmj8+eEH3308cokqEhWfku2xAzk99z1kfhB2YYMK6jd7qDaWzfBTCerUQsdw+VQB0xwZN
	x0lkN50d4IFY6TCaHPQ==
X-Received: from wrop10.prod.google.com ([2002:adf:f20a:0:b0:4a7:5aab:c222])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41c9:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4a63bbc379bmr5187806f8f.26.1795009668616;
 Wed, 18 Nov 2026 05:47:48 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:47 +0000
In-Reply-To: <20261013-clk-type-state-v6-2-a5e9977b3509@collabora.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-2-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134747.658063-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 2/7] rust: clk: replace `OptionalClk` with `Clk::get_optional()`
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Maurice Hieronymus <mhi@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_054751_402767_6A220F35 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 13, 2026 at 02:07:41PM -0300, Daniel Almeida wrote:
> +        /// Behaves the same as [`Self::get`], except when there is no clock
> +        /// producer. In this case, instead of returning [`ENOENT`], it returns
> +        /// a dummy [`Clk`].
> +        ///
> +        /// Equivalent to the kernel's [`clk_get_optional`] API.
> +        ///
> +        /// [`clk_get_optional`]:
> +        /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_get_optional
> +        pub fn get_optional(dev: &Device, name: Option<&CStr>) -> Result<Self> {

rustdoc appears broken here (putting the URL on the same line as
`[`clk_get_optional`]:` avoids splitting the link definition).

Otherwise LGTM:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
