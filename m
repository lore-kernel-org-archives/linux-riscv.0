Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EBBC5DF86
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ev6+NAdQs+q1tIe3jP8lsrgeHXytuUOffq++90yq+AM=; b=WnCUY7XLjQVnxf
	u1WTXnx+YNppoTLdpDriVH9naU0ufUu9RY6OqWNINqYzubI/zUxtr/+HBBca7PEBnbdSSKPE+8X+y
	N1RaiiBy1kJhxTUJxs0XT4rT9jYsb/BMMRcPOnj5E5lTFyuydOiEtQLkr1ddp0NPMEWTV7VEQ06x6
	q0IrRzaXY4qZX/eT6BYRDJ7+fbsk11zXiBC6iBE6X+Jr5PbXEBtQ7kxaL6/YjTomPIwYhAY67gFn0
	6WR+o5nkZrSmms2sCDyE0sni7qVZvCEiwiTqR5k5tKs9BR+vVfUmqkwjGZPB+POK4wh3VACTDW8bI
	7k7rqLZDsRErqDDDs0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwd7p-00000009TB3-1PkT;
	Wed, 19 Aug 2026 10:02:25 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwd7m-00000009TAR-28KZ
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 10:02:23 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5b014810feeso112267e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 03:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787133740; cv=none;
        d=google.com; s=arc-20260327;
        b=sYPioCIekQxEf8IL//3VRViszpfvHDT7SllRRkXQyDBVoZIANJbH23SPffHfZR82tP
         qbryhGGUjOTCnluDnSV/+BQFz6JncqaVboSA9t3FMtBjyN0npwn4o0/Rgwjv1bquBI9u
         98+mC3pKGUyHSHLcNNpCtFmrQNlGhYqT5ZxJ3GxuGcvkpUReNSAy68Fs94J0WUllIQU8
         u3ufVTt7+h2Y+3jzcTCVUwF8ng2zCrNxaC8gcLUK609JGMimo/aUWUrZuGjmCBfl/K68
         lO3yLmyv7OztHU/jYXMU8fFIDOSuYjfQvkeDk4WmL8AvXp2u3mSkz8fPGnwMgj0U6kRJ
         f5ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e/ykeQ5QUSsTkkdxsh/CxYBDe9VSjwD6RqDbgwXYXlM=;
        fh=dmxXk6ymgHaGLDExU6dvfv5PYl8iKDEYT0OuwYLEDFs=;
        b=U6g17H8/zUD1coiVtZPeANoO3dN8P0ZNVQx+/lxt0n0AMd5p3Lk0aMq33CLhUtKeK9
         PBFpL+cifg0ZCac4oirGhuKrjsJ7SmAcdyzoLHQSt1BQ7vA26qV1KACa5iNGdM0/O1+F
         C15iFfPSOKxqqoh4OETZFj2kFoith+GTr72E2XNm8KnzjeXPa1pMav8IZ0BAA5SHiIvz
         EBc4+4inyD9mql/BIIdPAqw/kn+w/bifqTwULr+pmor1nYmj5BUyZGKvZgCNNOb9E4SQ
         2RURXqd+LbEJfZFZ4mjhWaM/LTF0vPlZ5FVD5+jomtdstP7MQgUojdjJlOF0VavwAiNn
         gZfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787133740; x=1787738540; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e/ykeQ5QUSsTkkdxsh/CxYBDe9VSjwD6RqDbgwXYXlM=;
        b=UyzY3YvU78I3LfOSZLTSBbPXjf2c0EM9Ft/gy3u6zmJEE8TC4DMsRBFgmlILlg2gZG
         QVnsn65ua3LVFj6MaI32ejPLyK8qkAQD+BubOMt+/YTv6EQeTRaPtA+ZgQMXe+/hhxXE
         1vkIWW0k2e1WkbXwdQC6PHEAoEQ/1n4BuWdfn1DQ4rIC5uPK9Pu8x2YRIAPVdOr8n7Iy
         t8xiNlGqyACCy2niQ5YhhkNY2Y4CF5ZSPPFSQhKrP5W7Ly2RpiiRtNJC/mrcXIf7XbhO
         5Niv72xZMj2L+Uc6x6kU/w30RrkMzjqJ7jFVLLgerzaBGJM1/tWvLCKHp6SeJLiUKK7x
         TZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787133740; x=1787738540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/ykeQ5QUSsTkkdxsh/CxYBDe9VSjwD6RqDbgwXYXlM=;
        b=SifNURNgkznMkwRynijayM2OBqm+r6Oi6SE2wUuoT/CqRDxUaTyYTwR5LO9EDWzIcY
         8Y+R9tjkZQNt/fHoGLPH/x/YsK7cbooK3DEOdHa6ZuPmdd8WNNkUWSSoTb+KU7dzrS8q
         VuJmkDr/ZGnZCfpR5tgLiDIshTloCUe7M1+tF0C53nmI8UUej+PTIYLCqRzVG5V4ejsQ
         0HqL1yhXZG+FDSQtxZty6I+drBD5xzGa6CzNddTSFbCLiY7YhVkzzI0iq8VfChijv/EV
         1Wi97v8WiMwhdVDLkv8CBLMRV2KC92UzqkP1LHi7o91iuQ3dZuqBTm3SGtlV9+P2/6pA
         4GYA==
X-Forwarded-Encrypted: i=1; AHgh+RokbAuMjbbNAnY6DLqayF/dGDSrCb+6INSLV8BuHk268tqxmwlifXneT36Tlqbby4j7blHKcx+BAuLaTA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjcal5s6aN6iS6ap37yPNCGMiVvm0vZyfFQGvQYFitVuYvqUSc
	PNazG7zEOETdhUUAJyMPz9LPwfxZUgawB+xjoXxbOGZmvfDl8u+5/ORSAqRjqyw98Yx1xyayepO
	W3NQlsGj3E6YzHV136x8cy+6/WQAXY7Q=
X-Gm-Gg: AR+sD10diXGtkjGdjVnOe9iY/L1bukMzEvIi44VYMROo2JS2wyOmD/d4Ery2Lr+b78/
	QPWf+94D4auWpquWr9wFUJkZVxsTJ+5lAY4NwmU014zb0FOsmV6l7WgI14p8MWcOqbt7zwTVNi/
	qXMR5TxEGPXvu5keL2aMW+gnECmzBEKWGEmvDdYsNnEvcyoQTrD1JSxgxmpG0o4bnuWFGdHnK5f
	ScxD39s/M2VZMdLEUxdRqfio+wzj58QlHGS+pBf4AglQHwmB7nC5B77JnpiZCKwxrFiVpm8aNgy
	6s8y4wYH/BEmY1nx8DrBJ7sRbGBNV4WT9AcqS/hDwUzItRcpwc/tXq+9a0oqWKrAEcf0FZHabXJ
	uN4apryVZSWlNtYFzrT66iny4paDpsMquywSO5i/4gp08JIiow11QLqxqMe2L1cFoSg==
X-Received: by 2002:ac2:51c6:0:b0:5b1:5e89:30f6 with SMTP id
 2adb3069b0e04-5b478bcb669mr579903e87.3.1787133739473; Wed, 19 Aug 2026
 03:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260819084825.969116-1-mkchauras@gmail.com>
In-Reply-To: <20260819084825.969116-1-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Aug 2026 12:02:01 +0200
X-Gm-Features: AcwNN1Vu-RuAbNdoDEw2XNogoKXdWs1AZbTUBC5VtWKX5E0dSCywjtrmuOtTyPU
Message-ID: <CANiq72n=C68iaxuLVR5dbuBpf2FLMGwH8wtB+d5sNgOTv4BQ7A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, thuth@redhat.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_030222_636273_C4F0C950 
X-CRM114-Status: UNSURE (   9.01  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBdWcgMTksIDIwMjYgYXQgMTA6NDjigK9BTSBNdWtlc2ggS3VtYXIgQ2hhdXJhc2l5
YSAoSUJNKQo8bWtjaGF1cmFzQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGJyaW5ncyBwb3dl
cnBjIGludG8gbGluZSB3aXRoIHg4NiwgYXJtNjQsIHMzOTAsIGFuZCByaXNjdiwgYWxsIG9mCj4g
d2hpY2ggYWxyZWFkeSBkZWZpbmUgQVJDSF9XQVJOX0FTTSBhbmQgQVJDSF9XQVJOX1JFQUNIQUJM
RS4KPgo+IFN1Z2dlc3RlZC1ieTogRlVKSVRBIFRvbW9ub3JpIDx0b21vQGZsYXBwaW5nLm9yZz4K
ClNob3VsZCB0aGlzIGJlIFJlcG9ydGVkLWJ5PwoKSW4gYWRkaXRpb24sIHByb2JhYmx5IHdlIHdh
bnQgYSBMaW5rIHRvIHRoZSBvcmlnaW5hbCByZXBvcnQsIGFuZCBhIEZpeGVzIHRhZy4KCklkZWFs
bHksIHBsZWFzZSBpbmNsdWRlIHRoZSBlcnJvciBtZXNzYWdlIGluIHRoZSBjb21taXQgbWVzc2Fn
ZSAtLSBpdApoZWxwcyB0byB0cmlhZ2luZyBhbmQgYWxzbyB0byBzZWFyY2ggaXQgbGF0ZXIgb24g
ZXRjLgoKVGhhbmtzIQoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
