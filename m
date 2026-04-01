Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BA91112245
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTt7gquougnbiPPi3Vrmil9hO4rOH924qmVGyrLNDSY=; b=SmJJBygwDEpswi
	FGr297xsxV4QIG9ar90aVhrKaBt9NREMPavx0yvp6jmQtB+QkfdnBlDPd9mci8aATCaVTt4GLAIH5
	fekk6kCXSjzGKhXR9EtYqLIKvP2rAb3wM7ypVekPI5Zv9FJXK7oJkoW/Wd+b40XFZeWb42Ps7fJP2
	udvYAWY8qgnrrBVfJsejkjLhAh+Ad0ouzs/btxjpkRJd0VU4taSSqugOkZWna4QueZ/G3nnwBMED0
	c3E1WZKpBQDAGH8sxwXlEA1seC7YTCnXqOhRwhme76aiW/NadBzF/wduOznMtBLxoBLmu1lBqxwfh
	gBoYmNyZu9ftNjzULfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84XV-0000000GLmV-0wRo;
	Wed, 01 Apr 2026 22:59:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84XS-0000000GLiG-0WV3;
	Wed, 01 Apr 2026 22:59:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B263343F93;
	Wed,  1 Apr 2026 22:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A75C4CEF7;
	Wed,  1 Apr 2026 22:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084393;
	bh=xq9NcCud+LpB0atoCb11q9Wd2+LfbKDNAZgfYlibXt4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=AInBcHCOb6slZkVW3sn4yoBhwFNl5NlNG6FRxcOcIgbbEkjdrWTvy+wLlDWdNljcc
	 vk4SDzjYy6ZR3ZjdWJhBV2ccdBdnaQCwXJPz5Yi0tg45+MPA61hDBoLRIoTN4QvGxC
	 44aHSoDRJmSVpgbQHlXqD6c/CH53DMmvO7Q27cV7SRH799uEQrs0IUUfAUC3xvcSfc
	 HJj3S3JF4Rz5M7mt9X4oNWU03EttVxsgI9eMoA7Rv84vHKGz6jiEL4Zcrano0XnD79
	 RGUY+op3WG++YeUETBS3kAl5j78KT3CoatR+1yaVIVR8silujNcQMpHiLSrolxpScn
	 YBJyUoPe/kkSA==
MIME-Version: 1.0
Subject: Re: [PATCH 07/33] rust: kbuild: remove `feature(...)`s that are
 now stable
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
In-Reply-To: <20260401114540.30108-8-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-8-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434438.73816.15311163307401795216.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=313; i=tamird@kernel.org;
 h=from:subject:message-id; bh=xq9NcCud+LpB0atoCb11q9Wd2+LfbKDNAZgfYlibXt4=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzspLpTbOycju58p6Jb3ZLOTu+M754m9/iawQLs9w
 erJzAPzOiayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEx19zGG/0FezPN/HDOfzHe+bNJvl0z7Rx0bKgOunZEp7JeLPBIyT5+RYZfYni7
 GH+9rH6cZM1tXqnm23i9Nv9+0+PeGNO+Zi4rv8QMA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_155954_197327_54A00328 
X-CRM114-Status: UNSURE (   7.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 01 Apr 2026 13:45:14 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Now that the Rust minimum version is 1.85.0, there is no need to enable
> certain features that are stable.
> 
> Thus clean them up.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
