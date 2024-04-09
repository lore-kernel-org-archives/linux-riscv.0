Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819F0CD128A
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyNPNrq5KRlei8ObcXoHysP4Q04E9sfLzGVugMyyDDE=; b=VNVGZA83Cd7A3X
	gI9TLbhspnntyll3AZ6YLDzgSaJZ+mfPUzRdpleyWQ8kApxS/4VlAfVDlVwNWkLtN4mbRdaiHyTCv
	dl+s5V3/iVrYCYyUKE8gGXMidtZWZCNJ3izG/bKt50fc1MlOLsYy7QXxMgVXTbV7zdx2z3kgbL30T
	4lP3ADgodeGpXRNvvFpZzRl4Wc31K83/EmT81WoIq1UTAroSqpYs8MGFzQSampEmhBcZWbRx8ZCbh
	qAYQgzgD5G3b+HXzMIuONaKgEfQApxM6zwiPI/wBWinfpf8lXU6TApO9wlYHYaKcrZ85b4T7zqN62
	WBLUStQF9bzgtR3B9a5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruEpK-000000032CK-0QLj;
	Tue, 09 Apr 2024 17:00:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruEpB-0000000325A-0ooA;
	Tue, 09 Apr 2024 16:59:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 68D22CE22A6;
	Tue,  9 Apr 2024 16:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DAEC43394;
	Tue,  9 Apr 2024 16:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712681994;
	bh=FncKWsKbg/hFr6GnUHocdduFJVjZhPin/nlM8ZG9evk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aotgi/mjzEYHwzEVw6SPTEWRw8pgK6bl3EZbUUhiLE2wDXCzJVqGLZVPoNr/CMvgT
	 H9TmtLLcE1bCzZaEkYCwTzITgO05jeex9m4DsVZXuD3Y8sQ+/2basDNQ+0TD4lKlCT
	 cGAHdmD3jRpxUvKfiA6b3PdEL9gJRuNamxiGi1rNQHRm69ypMekvMNLj3gIh5DWQ+K
	 3MQxlZl4KxdIiWu2pYBK5d2n2bQ+L9wlms3e/u5qct/dU3fuk6T1O1cYJYm9lqyMn8
	 nlMcs3HEWsfIHLaxSP+bY9pq5qXzsIR5fa9hpFrFifzsLQ8DpGnVHFk0OV/Ayuor1W
	 q2lPrqPTwWVxw==
From: Will Deacon <will@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Joel Granados <j.granados@samsung.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/7] sysctl: Remove sentinel elements from misc directories
Date: Tue,  9 Apr 2024 17:59:35 +0100
Message-Id: <171267686554.3168517.3836229489434629100.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_095957_488199_F61B62CE 
X-CRM114-Status: GOOD (  10.52  )
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

On Thu, 28 Mar 2024 16:57:47 +0100, Joel Granados wrote:
> What?
> These commits remove the sentinel element (last empty element) from the
> sysctl arrays of all the files under the "mm/", "security/", "ipc/",
> "init/", "io_uring/", "drivers/perf/" and "crypto/" directories that
> register a sysctl array. The inclusion of [4] to mainline allows the
> removal of sentinel elements without behavioral change. This is safe
> because the sysctl registration code (register_sysctl() and friends) use
> the array size in addition to checking for a sentinel [1].
> 
> [...]

Applied drivers/perf change to will (for-next/perf), thanks!

[7/7] drivers: perf: Remove the now superfluous sentinel elements from ctl_table array
      https://git.kernel.org/will/c/f66ae597411c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
