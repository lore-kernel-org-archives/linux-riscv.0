Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A648D606A330
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c2nrJUv9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i6au/myG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kgDidCVLdVv9dvMAST/K3NJDbe+yjbCrugDuyMYRBgg=; b=c2nrJUv9W8ZxklimbLsOOV0XE/
	88l0k6o1tCnqn1mHKsFPfg+pj8YU9grH0uFSyovfh9g1HABkrNxvYjbBXe+BK9fZPYW1T5547m87n
	N7Hoo8P0CrFfLjh+l01wuZKlNHswNbM2DQRi3vb6p0Qq/K9c0TSK9k4FB5cerH5O8ADxLuKyMVJup
	ey7w9gPJH2YFQ2flGYvhDiiZV+c+oTlAiMA8kvDOW06Isytqe3uL1NhmlXaO04aAU0PsWT4RS7Byb
	UU7L2LfifyXnWd2gJaZBC8zcjlKgVHKhb/meFgfHG3NPPJlbaAqPfMT/yyw2RbZkMFaEXIHRsScfl
	9IuAfoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS2U-00000001Alf-338c;
	Mon, 09 Nov 2026 16:16:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS2R-00000001Aky-32xE
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 16:16:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C9166618E8
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 16:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775841F00900
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240966;
	bh=a+uAUjhXKEApJwrL+oxv5vaGLoNsPevTJGtjjvevzRI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=i6au/myG9p4GsOKM3Vi2VV8GPL0M54b1Q0aP+nLEVBGLWzFiIIQL51O1MPCO+TJ4P
	 dOOlbWjxw1rDvIUfDn3HiHecyjD8xeH7auCSya7gDynZpsG6ifrwDgv2bj7GEdYFIS
	 6koTwc3GNJ3y4HxS5QqxvXa+YXh6iYr6A8T2PwO6HCn5shYGBESjwyGMR34m80I3S6
	 RwOdZ0texE0E8hg2AoMGmeS8P3ZBs66cKKylaV0qlfR4zBPdrX44gquG1jpaLHZqWu
	 iVi83j2JSgA+Ktlq/6aFAKZQLOSxJXn2dcRSQ5YbGFPhVhc6rBxkKvUFpemhYanYHR
	 PRqMUgFKiJXFQ==
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-845788309b4so456753a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 08:16:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGp2cht5tteVKwqdzwGyikS8tX790TtHw3cD6XTFPKUeiFlMDeZYE3ZLCs/wKHqrpZKAVeT0mtAjV4irA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8ezWR1+7Q9cZmoS6hdqcH0X3HzbqjVAko+KVoHVamj6/Hj/9Wf
	LvHyVGyTLJtARw2dI2t2+kYVegQvPoNDBzbjmTGQst7fANr1nDImsSux8zUJNMXFNF6tD0SMreY
	f2AGuCAuvvbP6CHegZXT4POv4P+G9Z1c=
X-Received: by 2002:a05:6808:1209:b0:532:4867:8916 with SMTP id
 5614622812f47-5683c9e2ac2mr94540b6e.4.1794240965556; Mon, 09 Nov 2026
 08:16:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:15:47 +0900
X-Gmail-Original-Message-ID: <CAGb2v66J=FaqimwrqrbVuBVb5GMuhizp2Hnt6vN7CRMNhiuCFA@mail.gmail.com>
X-Gm-Features: AclHuK8oi8fLMntRJV56LqbfIWbbWAJenIS4kljcKk7VrVTWKVxckSNOSzGxgTs
Message-ID: <CAGb2v66J=FaqimwrqrbVuBVb5GMuhizp2Hnt6vN7CRMNhiuCFA@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] clk: sunxi-ng: a733: Add PRCM CCU
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBTZXAgMzAsIDIwMjYgYXQgMjoyN+KAr0FNIEp1bmh1aSBMaXUgPGp1bmh1aS5saXVA
cGlnbW9yYWwudGVjaD4gd3JvdGU6Cj4KPiBBZGQgc3VwcG9ydCBmb3IgdGhlIFBvd2VyIFJlc2V0
IENsb2NrIE1hbmFnZW1lbnQgKFBSQ00pIG1vZHVsZSBmb3VuZCBpbgo+IHRoZSBBbGx3aW5uZXIg
QTczMyBTb0MuIFRoaXMgY2xvY2sgY29udHJvbGxlciBtYW5hZ2VzIHRoZSBjbG9jayBjb250cm9s
Cj4gYW5kIHJlc2V0IGZ1bmN0aW9ucyBmb3IgZGV2aWNlIG1vZHVsZXMgd2l0aGluIHRoZSBDUFVT
IGRvbWFpbi4KPgo+IFRoZSBQUkNNIG1vZHVsZSBpbmNsdWRlcyB0aGUgbWFuYWdlbWVudCBvZiB0
aHJlZSBwcmltYXJ5IGJ1c2VzOiByLWFoYiwKPiByLWFwYjAsIGFuZCByLWFwYjEuIEl0IGFsc28g
cHJvdmlkZXMgY2xvY2tpbmcgZm9yIHNldmVyYWwga2V5Cj4gcGVyaXBoZXJhbHMsIHN1Y2ggYXMg
Ui1VQVJULCBSLUkyQywgUi1TUEksIGFuZCB0aGUgUi1SSVNDViBzdWJzeXN0ZW0uCj4gQWRkaXRp
b25hbGx5LCB0aGUgcmVzZXQgbGluZXMgZm9yIHRoZXNlIG1vZHVsZXMgYXJlIGludGVncmF0ZWQu
Cj4KPiBUZXN0ZWQtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+IFJl
dmlld2VkLWJ5OiBFbnpvIEFkcmlhbm8gPGVuem8uYWRyaWFuby5jb2RlQGdtYWlsLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBKdW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+CgpSZXZp
ZXdlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
