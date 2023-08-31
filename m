Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F93C83F01
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 15:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+ManlHikNoDgWuBugzGm+gFfZ3BMtbV/TX1FaRMqR8=; b=pcQAny4n0X4RXg
	9y/Y8ZuxTbeZwFSiJqfSlQfzDtJrfjgEBl4bEJjvbXw4YhZbT6fflVx1casFWqwpCeZZ23ZxP1b/1
	H5oLjOqtqwUQNb6Xs856H1Los8VCIo/4IMKtdnv/Ksf+9sCe1LSPeumRUMyFWToG6TVu9Au9RCK6I
	G5NYajEg4swT/Tnf0ClMZ6HbIM/1QZ2J+1wdY97BeHl0oc+xcUOqZPPRYDocCKAVbFl8n1Z398DOW
	DIlgWPxYHapBRCtBKkwp8O9ZwVBogPWHQWVjbDwY4DcPXWE7euCxfR1sAtmoypBAMRpUBOhFQ/uyl
	2M3tQ9zrEbLYZgvR2krg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbjrd-00FWdu-2P;
	Thu, 31 Aug 2023 15:45:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbjrZ-00FWcT-36;
	Thu, 31 Aug 2023 15:45:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A5A49B8229D;
	Thu, 31 Aug 2023 15:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74758C433CB;
	Thu, 31 Aug 2023 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693496738;
	bh=J1cZYDRnTeF8cAXMCJ0XFEKzFUSLXJ/iqg35dWO1Xlo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m9sJMKHABnRVgyrpaiqO/6dri9ODMIQ2UYtcPw0s1RRnkYP9nAEi02nSlDcnZBfVu
	 dF8V9bQfD784m7vV8UNt3V0eIV1U7+y+3czS4NW3LOly5T1LiDbnS/3JL0HB/7QH+G
	 ND/7Xk0LhEEVbMllR2fDp+zaRReZaOmDIEpvign+dD4FG4hPedRR2Z5Hm7NrTH0lrE
	 bxnvUQxnYZZ7cB0ZeA9rzXEQV7Cls3FompIOVbhBiWmGlfwBS0wEhCgvgfaEeGSpGC
	 nKHUtgrRMu9rYOMCOMknC102ncMv0mcCI1WaN2y3pSQFFC3KCBOMjELtAYfODpFSiJ
	 Xx4MtQi7jaZZw==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1cccbd43250so550554fac.1;
        Thu, 31 Aug 2023 08:45:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YyjJtx1FBvE2EoNW/dfnvAabwYfCq7ZnEcxb8x13I54vu0XObK2
	HSQ9tqwFd8k7x/M1YQEc8WGE01mDWkBGV0rsbF0=
X-Google-Smtp-Source: AGHT+IEUJMNylrks/fy5NvmaNAFMnHbg4XiCcdriY8ZpK4zEHo9Dox7bvKVqZcq4Wd6iiC2FHgRGNtjlem0M8nYGzko=
X-Received: by 2002:a05:6870:392a:b0:1be:fe7c:d0a6 with SMTP id
 b42-20020a056870392a00b001befe7cd0a6mr6668317oap.2.1693496737720; Thu, 31 Aug
 2023 08:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230825194329.gonna.911-kees@kernel.org> <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
 <87ttsjlmho.fsf@mail.lhotse> <ZO2NVLipjlzIh0YS@bergen.fjasle.eu>
 <CAK7LNARjsB+LTBGRfWX68Ld7oehhuBv9SY8scoC=Xk8EJc-OHw@mail.gmail.com> <202308301702.4EB6F55@keescook>
In-Reply-To: <202308301702.4EB6F55@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 Sep 2023 00:45:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNARtiS5ePpq9vsQvhQs5AC_FGbsGycM1Bn9jtKvH1rRwpA@mail.gmail.com>
Message-ID: <CAK7LNARtiS5ePpq9vsQvhQs5AC_FGbsGycM1Bn9jtKvH1rRwpA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
To: Kees Cook <keescook@chromium.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_084542_160203_A656CEF0 
X-CRM114-Status: GOOD (  14.23  )
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

T24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgOTowM+KAr0FNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hy
b21pdW0ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDI5LCAyMDIzIGF0IDExOjU3OjE5UE0g
KzA5MDAsIE1hc2FoaXJvIFlhbWFkYSB3cm90ZToKPiA+IFRoZSBhdHRhY2hlZCBwYXRjaCB3aWxs
IHdvcmsgdG9vLgo+ID4KPiA+IEkgZHJvcHBlZCB0aGUgImluIHRoZSBmaXJzdCBsaW5lIiByZXN0
cmljdGlvbgo+ID4gYmVjYXVzZSBTUERYIG1pZ2h0IGJlIHBsYWNlZCBpbiB0aGUgZmlyc3QgbGlu
ZQo+ID4gb2YgY29uZmlnIGZyYWdtZW50cy4KPgo+IEdvb2QgY2FsbC4gWWVzLCB0aGlzIGxvb2tz
IGV4Y2VsbGVudDsgdGhhbmsgeW91ISBEbyB5b3Ugd2FudCB0byBzZW5kIGEKPiBmb3JtYWwgcGF0
Y2g/IFBsZWFzZSBjb25zaWRlciBpdDoKPgo+IFJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNj
b29rQGNocm9taXVtLm9yZz4KPgo+IC0tCj4gS2VlcyBDb29rCgoKWW91IGNhbiBzZW5kIGl0IHdp
dGgKQ28tZGV2ZWxvcGVkLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgoKCllvdSBjYW4gYWRkIGhlbHAgbWVzc2FnZXMgdG8gbW9yZSAqLmNvbmZpZyBmaWxlcyBpZiB5
b3UgbGlrZSwKYW5kIGFkZCBTUERYIHRhZ3Mgd2hpbGUgeW91IGFyZSBoZXJlLgoKCi0tCkJlc3Qg
UmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
