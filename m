Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FA010FCAF2
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEhDgusrRga9upMgbPRl1rPTAZzTdL+XtsocJ0mIaD0=; b=wMs7+9n27nyDSi
	r75+KMboWvJcszHaqwuo/LVJcePE+xINpfuUnUyHrKxvU3v5p2bXX6De+OAP+DbTdkTVzevFgGUyP
	i8hf8CfeWLWwp+rXl0NAZGlu4eI7b/jIqq+06OU0mjMEBPuH10xb27C65CIROjRUYaFFDqICN8Iav
	PJMoG9qkbrB2EDSzn+8PGafErtrD1gQ2vyZoanuwNKTBwbpIWzHNXMBj6SK6FbMq1E66JuN5H8v3H
	YTULD1QvuG8yz8CcuKhuldF4jlx1v5ow7ouvpjuo3GvY4A3u3N7iGcLjxJEZ9J02YcPRLLg/QcvXp
	uOMZ7ZbfEqgL1pRXEVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Wz-0000000GLOD-31Gd;
	Wed, 01 Apr 2026 22:59:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Wy-0000000GLNn-2WPd;
	Wed, 01 Apr 2026 22:59:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5278A600CB;
	Wed,  1 Apr 2026 22:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B649C2BC9E;
	Wed,  1 Apr 2026 22:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084363;
	bh=MKMHrhf5f3swVCJiQ9ck1suDitt1z6bHk5UKf3dOC/c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=nvht4maVaLSV0yBm+MGm9onlGFeh24Taql7u+JCMSZ+g5gvpvU8mAknzbdq86McXn
	 JVFsi99dCPNCcvkZX62r31+ef491iTuBuXXJ83buTG/uADO5bLDsBf/r7h+qv+4u6Q
	 p1BPRdifVrDxipq70UWVVgsiso/wWEEMPfu2jAS21y9N0J1kMHkHidCFxBM9k854gv
	 g+yBgTQVMUwFe7hd7zX3Mo3uXOeQMmjBV8Mfp+DYqJ8B6aZPD9rRtwUVzxSulDAPPm
	 GX2AaWB6iZF9YlMWzAvsWasloWD/D7+a5Dfnjbb/mxDPk3su9g6uZsi28PLD210hoO
	 FCnhq9DLd8Bkg==
MIME-Version: 1.0
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to
 1.85.0 (Debian Trixie)
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
In-Reply-To: <20260401114540.30108-2-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-2-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434432.73816.7258683763340014270.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=493; i=tamird@kernel.org;
 h=from:subject:message-id; bh=MKMHrhf5f3swVCJiQ9ck1suDitt1z6bHk5UKf3dOC/c=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF9uu5jzYVN60XXfVY8vseiml5kOtXVV7TlzOeLLgo
 ez3pZyPOyayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEy1/RKGP5yzCi/r99xe1ee1SZiNcVeQjPHv5Nttf3S94iJ15B+7xjD8zyyxiDs
 t9DLK9fBe5gViIafPPih+skZuZ/Qmxtim3akzmQE=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
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

On Wed, 01 Apr 2026 13:45:08 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
> 
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
> 
> [...]

Acked-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
