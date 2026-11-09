Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02880606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 13:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PyzoCwtx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SGprgrYH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MJe936WT0CZbUkOP4Gta70sJy9suixrhUAoNXmp9b0c=; b=PyzoCwtxvqDGI1U7WnHnWE3W9a
	/7EGVdANa6qe9ey9dqk9WDBaEazFWsXJfYOdH+V17pEx/JApJqETMEu3Rjuai/A6OPXkukQwfWUPO
	EM4tCAy3YUpo7VzSgCIGhJ1rb9MjoHzROqAdibpwQtUcbBFaCxepdih4NCM+9CZTTSb2NbWEyCl/u
	paovDZNw0PPxYg3ZT6HBpxnaHDd+3wOtEbJSUjB4yY9SgZUuhYmiQYhE59xGnR+i+LV1D3MDm52GW
	61tPaXaHXjznWXcyD2Ur2QqBGGdA0juLhisSS2ichMOXb2IbyfpA/1v5c8NjtPQQ3hHW8WobS/Q70
	RnbmX9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPkj-00000000svr-1zql;
	Mon, 09 Nov 2026 13:49:41 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPkd-00000000sv0-2ZJp
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 13:49:37 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-70bf1671c21so449500eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 05:49:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794232174; cv=none;
        d=google.com; s=arc-20260327;
        b=mbINimSfDWjQLnrY5dhV1EhzP/gL3U+1EbUaOSqatUGb644eNslJy+ZxmPqMcnPN0d
         zi5rX+9Zpe0Ar1kCfpJNLeprykmAyT6G/TH0r2bzFydD0S0/C9k5hfVd5JsGzcj3Tqbw
         JI1/IZU+xG2ajc95tMkw73jCuuIK7ZuvmCWhEl7HEV20tFIW0FiVAVKeY/c4dwcDN0qK
         6BFTkimtaEvayknMWWoDeLk1k/jUo4/sJFHR7HFn/5/tlZwgO+S4grED6Cs4cQSOBbiy
         8QPAgsuDWaYR4XtfB4Wr/QEw9/G1uG4sSefAyuoZ+KRWqcPsybxG/jjDG1kc6/Ssz2ka
         twGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FyAr9qqHmbSkkVwj13RsrpvkaRMjPb3WgaMEGtmY00I=;
        fh=FFrUtnrtxTjXlDwfJJoT1M0t4MuHjzsAgcD/OLEyOh0=;
        b=hiqrB6bJB/0Jy1W12k6oxT4+izt08gMIyXz6ucUgA5l+vbPbSMy07/tJ1Xlyfv9efL
         yNEGmW6Z++kzq+2dsLlzKexqR5qOsYatQ6/ogFQgi4NuwCdt5zzmFnBAlktlpPmffkAN
         yrONZvws8rHnZT6Uj78LetN3B0c0VX1IcE8hOfHS7/7ljN28Bo638Nzjrgo/XNJ+xJ2/
         EV6xK567CTSZ1StJPERjxYKl70k/+DAKCQLWFIspTPIcUGUZ0hlQLsvVlU5/rAp1bQPf
         12dD0B15nFcNfFSYcKUd+JCDb4wvHuAGqeInbs1RhQ129Z8tDhJdnh6HFGJLc3iPtWOL
         9Prg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794232174; x=1794836974; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FyAr9qqHmbSkkVwj13RsrpvkaRMjPb3WgaMEGtmY00I=;
        b=SGprgrYHEiSE7pBk8zWE+Ss8I22U0HrZvmUL+HVq0BVH/1TSFbL7PsJzplrhw1yFwg
         aUg9FMq9bANPBbvKsmh6FsjmFM5AY8NGu12OVBsSczXnVofknYdB4qCKIB1HBuUXU2dh
         ahArZCq4R2qYc1Phrsr8HDV5YpVl4tK6BlQ/ph5X6s/gGxcfddlDteUBCB5vrtwHSiX5
         9IVC6bEcRbu/R/UhGlcM/NR58PFvpgRCTBLzcnBT8bqreF4uYmxO61fr+XDOFXr/Fon5
         y/02puK/JwziHdcSHU9vmKe/SkmbbJusavS+2omOMc7lPiDxAa0/xFgptu4UzvTLvkKr
         mwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232174; x=1794836974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyAr9qqHmbSkkVwj13RsrpvkaRMjPb3WgaMEGtmY00I=;
        b=jwpQ+lqeFzUe/bJaaGk/SdZ2bY5ac4aNG6UDnOH4xdUbYbfAi0J7xowghdNpAo+9Ym
         1cWT/MUL2bEWBSR3jF5T2Daz59knm5cHygdCOZDV/slJ/U8FrqVzFJZ3LWUm0ot8fTa9
         W88k/R/itrKUjV4g2i+uxW34xlcoUceJUTXUG5mMtq13aPhBlDkTjDQ8eb6WBOiv/z79
         cpxz/CNnd2+iQV8cDNOHw2XNOlc/W/+20saY6Zki9zL/jsmD5ZYpZz6BXAxCX29Hq4j6
         3hPj0jlGOqsWkiTaBaykuc0dd+FtUBbsuZ9YYVxv0MKDc5iPjNsfLDAA1Qi329OXb3oy
         yjAw==
X-Forwarded-Encrypted: i=1; AL+hErGYpXmg65jMe7qcjfxvRXXn5L+morGwtHBEmNczB0PSKioULPo7kZSJw0ClHay+YzEvB2X7gqnh30rRvw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/M4nH9IEqHD7af3hXaxv/auBvt7FMwibWCN/9xagTbS5fgHqD+
	7z7O5opZ2qEKuIZV7X+EPrwOiKE2E2u8g+F8KOEafUbsO9aC2WnEL84BRkJLTPIaH9LgN8hcebV
	AD25WxDpyBRCYr3JmtbJDI1zY8S9PevM=
X-Gm-Gg: AYBFou00n0wIuysB5RPa63GD1YTbtdqgdRsJRPdtLvrs7QRLEZ/qehJXHFuHoegTzTx
	MwJHZculvfjPiI45xGmGeFdd1pppJszsOiAA7zwsNQS84nar43pFRziBIBhqHOzdLTStxC6GUZg
	n1FTQ+JFdK+X581/Q5NMlmfPfhSWFyl3oCHyjqf3p7f1ibEk8ihaKvLt8ohKij21xW0dwSwWqaz
	wMbBTwXSxuwwCSAoF8lOKXU75ma5RmI1CZJzdcapI0VqST+vRWCmNrXjPcifXNcys8Cs5EpE9Ly
	xvO2RxvZjP3FE84au35iMOyHtsKGigZQTMxUT03JdbfD3yoABecJ3wyA0/jrjDxflFfkOUaKcOL
	IedLzQ9X+mxkL+k7nyaXyUkeKDUdvE5dWpAhcs/7jGsdGuaTr1UZ5N2ApAA==
X-Received: by 2002:a05:6820:55ca:20b0:716:d48a:ee93 with SMTP id
 006d021491bc7-7170f26a5c0mr1420360eaf.61.1794232173953; Mon, 09 Nov 2026
 05:49:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
 <20260930150213.799245-4-anup.patel@oss.qualcomm.com> <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
 <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com>
In-Reply-To: <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Nov 2026 08:49:20 -0500
X-Gm-Features: AclHuK9ZpOtwMmKrK6lvy0K3xqP_D3JRQq0vMpVANN7aLErFYx3-QsCqINQknZs
Message-ID: <CABb+yY0SZuCQoLF65EGY0=R4=p7fO3SU53pPhT1cgAj26u8gNA@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Anup Patel <anup.patel@oss.qualcomm.com>, Doug Anderson <dianders@chromium.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_054935_660779_D8483B3D 
X-CRM114-Status: GOOD (  30.76  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjksIDIwMjYgYXQgNzoyN+KAr0FNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBIaSBKYXNzaSwKPgo+IE9uIE1vbiwgT2N0IDEy
LCAyMDI2IGF0IDU6NTLigK9BTSBKYXNzaSBCcmFyIDxqYXNzaXNpbmdoYnJhckBnbWFpbC5jb20+
IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgU2VwIDMwLCAyMDI2IGF0IDEwOjA24oCvQU0gQW51cCBQ
YXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJv
bTogQW1pcnJlemEgWmFycmFiaSA8YW1pcnJlemEuemFycmFiaUBvc3MucXVhbGNvbW0uY29tPgo+
ID4gPgo+ID4gPiBTb21lIG1haWxib3ggY29udHJvbGxlcnMgY2FuIGNvbXBsZXRlIGEgdHJhbnNh
Y3Rpb24gZW50aXJlbHkgd2l0aGluCj4gPiA+IHRoZSBjYWxsaW5nIGNvbnRleHQsIHdpdGhvdXQg
Z29pbmcgdGhyb3VnaCB0aGUgcXVldWVkIFRYIHN0YXRlCj4gPiA+IG1hY2hpbmUgb3IgYSBUWC1k
b25lIGludGVycnVwdC4gQWRkIGEgc3luY2hyb25vdXMgc2VuZCBwYXRoIHNvIHRoZWlyCj4gPiA+
IGNsaWVudHMgY2FuIHJlcXVlc3Qgb25lIGFuZCB3YWl0IGZvciB0aGUgcmVzdWx0IGRpcmVjdGx5
Lgo+ID4gPgo+ID4gPiBDb250cm9sbGVycyBhZHZlcnRpc2Ugc3VwcG9ydCB2aWEgdGhlIG5ldyBz
ZW5kX2RhdGFfc3luYygpIG9wIGFuZAo+ID4gPiBjbGllbnRzIG9wdCBpbiBieSBzZXR0aW5nIHR4
X3N5bmMgd2hlbiByZXF1ZXN0aW5nIHRoZSBjaGFubmVsLgo+ID4gPgo+ID4gPiBDaGFubmVscyBi
b3VuZCB0aGlzIHdheSBtdXN0IG5vdCBjYWxsIG1ib3hfY2hhbl90eGRvbmUoKSBvcgo+ID4gPiBt
Ym94X2NsaWVudF90eGRvbmUoKSwgYW5kIG1ib3hfc2VuZF9tZXNzYWdlKCkgYW5kIG1ib3hfZmx1
c2goKSBub3cKPiA+ID4gcmVqZWN0IHRoZW0sIHNpbmNlIG9ubHkgbWJveF9zZW5kX21lc3NhZ2Vf
c3luYygpIGlzIGEgdmFsaWQKPiA+ID4gdHJhbnNtaXQgcGF0aC4gVGhlIGNsaWVudCByZW1haW5z
IHJlc3BvbnNpYmxlIGZvciBzZXJpYWxpemluZyBjYWxscwo+ID4gPiB0byBtYm94X3NlbmRfbWVz
c2FnZV9zeW5jKCkgYWdhaW5zdCBtYm94X2ZyZWVfY2hhbm5lbCgpLgo+ID4gPgo+ID4gU2VlbXMg
bGlrZSB5b3Ugd2FudCB0byB1c2UgbWJveF9jbGllbnQudHhfYmxvY2suCj4gPgo+Cj4gQXBvbG9n
aWVzIGZvciB0aGUgZGVsYXllZCByZXNwb25zZSwgdGhlIHBhc3QgbW9udGggSSB3YXMgdHJhdmVs
bGluZwo+IGZvbGxvd2VkIGJ5IHRoZSBMaW51eC03LjQgbWVyZ2Ugd2luZG93Lgo+Cj4gV2UgaGFk
IHRyaWVkIG1ib3hfY2xpZW50LnR4X2Jsb2NrIG1ldGhvZCBpbiB0aGUgcGFzdCBhbmQgd2UgaGFk
Cj4gZm91bmQgaXQgdG8gYmUgbm90IHN1aXRhYmxlIGJlY2F1c2UgdGhlIG1ib3hfc2VuZF9tZXNz
YWdlKCkgd2lsbAo+IHVzZSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoKSB3aGljaCBjcmFz
aGVzIHdoZW4gY2FsbGVkIGZyb20KPiBhbiBhdG9taWMgKG5vbi1zbGVlcGFibGUpIGNvbnRleHQu
IE91ciBleGlzdGluZyBtYWlsYm94IGNsaWVudHMgKHN1Y2gKPiBhcyBzeXN0ZW0gbXNpLCBjbG9j
aywgZXRjKSBkbyBtYWlsYm94IHRyYW5zZmVycyBpbiBhbiBhdG9taWMgY29udGV4dC4KPiBEdWUg
dG8gdGhpcyByZWFzb24sIGN1cnJlbnRseSB3ZSBzZXQgbWJveF9jbGllbnQudHhfYmxvY2sgPSBm
YWxzZSAmCj4gbWJveF9jbGllbnQua25vd3NfdHhkb25lID0gdHJ1ZSBpbiBhbGwgb3VyIG1haWxi
b3ggY2xpZW50IGRyaXZlcnMuCj4KPiBVc2luZyBtYm94X2NsaWVudC50eF9ibG9jayA9IGZhbHNl
ICYgbWJveF9jbGllbnQua25vd3NfdHhkb25lID0gdHJ1ZQo+IHN0aWxsIGRvZXMgbm90IGF2b2lk
IHRoZSBzcGlubG9jayBzZXJpYWxpemF0aW9uIGVuZm9yY2VkIGJ5IG1zZ19zdWJtaXQoKQo+IGZ1
bmN0aW9uIHdoaWNoIHdvcmtzIGZpbmUgYnV0IGFkZHMgdW5uZWNlc3Nhcnkgb3ZlcmhlYWQgYW5k
IHByZXZlbnRzCj4gcGFyYWxsZWwgbWVzc2FnZSBUeCBmcm9tIG11bHRpcGxlIENQVXMgdG8gdGhl
IHNhbWUgU0JJIE1QWFkgbWFpbGJveAo+IGNoYW5uZWwuCj4KPiBUaGUgU0JJIE1YUFkgbWFpbGJv
eCBjb250cm9sbGVyIGRyaXZlciBzaW1wbHkgc2VuZHMgbWVzc2FnZXMgdG8KPiBoaWdoZXIgcHJp
dmlsZWdlIGZpcm13YXJlIHVwb24gVHggdXNpbmcgU0JJIGNhbGxzIGFuZCB3aGVuIHRoZSBjYWxs
Cj4gcmV0dXJucyB0aGUgcmVzcG9uc2UgZGF0YSBpcyByZXR1cm5lZCB3aXRoIGl0LiBBbHNvLCB0
aGVyZSBpcyBubyBUeCBjb21wbGV0ZQo+IGludGVycnVwdC4gVGhlIGhpZ2hlciBwcml2aWxlZ2Ug
ZmlybXdhcmUgbWF5IGZvcndhcmQgdGhpcyBtZXNzYWdlIHRvIGEKPiBtaWNyb2NvbnRyb2xsZXIg
b3ZlciBSUE1JIHF1ZXVlcyBPUiBpdCBtYXkgY29udGV4dC1zd2l0Y2ggYW5kIGZvcndhcmQKPiB0
aGlzIG1lc3NhZ2UgdG8gYSBzZWN1cmVkIGRvbWFpbiAoZS5nLiBPUC1URUUpIHRvIHByb2Nlc3Mg
dGhlIG1lc3NhZ2UuCj4gVGhlIGhpZ2hlciBwcml2aWxlZ2UgZmlybXdhcmUgdGFrZXMgY2FyZSBv
ZiB0aGUgc2VyaWFsaXphdGlvbiBhbmQgYWxzbyBhbGxvd3MKPiBwYXJhbGxlbCBTQkkgTVBYWSBj
YWxscyBmcm9tIG11bHRpcGxlIENQVXMuCj4KPiBUaGUgTUJPWF9UWERPTkVfQllfUkVUVVJOIGFu
ZCBzZW5kX2RhdGFfc3luYygpIGNhbGxiYWNrCj4gYWxsb3dzIHVzIHRvIGF2b2lkIHRoZSBUeCBx
dWV1aW5nIGFuZCAiY2hhbi0+bG9jayIgZm9yIFNCSSBNUFhZIG1haWxib3gKPiBjaGFubmVscyBz
aW5jZSB0aGlzIGlzIGFscmVhZHkgdGFrZW4gY2FyZSBvZiBieSB0aGUgaGlnaGVyIHByaXZpbGVn
ZSBmaXJtd2FyZS4KPgoxKSBZb3VyIGNsb2NrcyBjYW4ndCByZWFsbHkgZXhwZWN0IHRvIGJlIGF0
b21pYyAgLQpycG1pX2Nsa19lbmFibGUvZGlzYWJsZSBhcmUgcHJlcGFyZS91bnByZXBhcmUgY2Fs
bGJhY2tzIHdoaWNoIGNhbiBiZQpjYWxsZWQgZnJvbSBhIHNsZWVwYWJsZSBjb250ZXh0IGFueXdh
eS4KMikgU3lzdGVtLU1TSSBpcyBhIGdvb2QgY2FuZGlkYXRlIHdoaWNoIG1ha2VzIG1lIG5vdGlj
ZSB0aGUgc2htZW0gaXMKcGVyLWNwdSBzbyBjdXJyZW50bHkgYSB3aWRlci1zY29wZWQgY2hhbm5l
bCBsb2NrIGlzIHByb3RlY3RpbmcgaXQuIElmCnlvdSB3YW50IGxvY2stZnJlZSBhY2Nlc3MgdG8g
dGhlIGNoYW5uZWwgeW91IG5lZWQgdG8gZ3VhcmQgc2htZW0KYWNjZXNzIHdpdGggbG9jYWxfaXJx
X3NhdmUvcmVzdG9yZSB3aGljaCBpcyBhbnl3YXkgd2hhdCBzaG91bGQgaGF2ZQpiZWVuIGRvaW5n
LgoKRm9yIHRoZSBzeXN0ZW0tbXNpIGNhc2UgSSB0aGluayB0aGUgZnJhbWV3b3JrIGNhbiBiZSBt
b2RpZmllZCB0bwpzdXBwb3J0IGl0IGJldHRlci4gSW5zdGVhZCBvZiBhIHByb2xvbmdlZCBiYWNr
LWZvcnRoIEkgaGF2ZSBkcmFmdGVkClsxXSBzdXBwb3J0IGZvciBhIG5ldyBsb2NrZnJlZSBhcGkg
YW5kIHRoZSBzZW1hbnRpY3MgZG9jdW1lbnRhdGlvbiwKYmVjYXVzZSBJIGFsc28ga25vdyBob3cg
b3RoZXIgcGxhdGZvcm1zIG1heSBiZW5lZml0LiBQbGVhc2UgZWl0aGVyIGFkZApwaWVjZXMgZnJv
bSBpdCwgb3IgZXZlbiBiZXR0ZXIgb3duIGl0LCBhZGFwdCBpdCBhbmQgdGVzdCBpdCBiZWZvcmUK
c3VibWl0dGluZyAoZXZlbiByZXBsYWNlIG15IHMuby5iIGlmIHRoZSBhdXRob3Igd2FudHMpLiBU
aGF0IHdpbGwgYmUKdGhlIGxlYXN0IGVmZm9ydCBmb3IgYWxsIG9mIHVzLgoKUmVnYXJkcywKSmFz
c2kKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2ph
c3NpYnJhci9tYWlsYm94LmdpdC9sb2cvP2g9anNiL3JmYy1zeW5jaC14ZmVyCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
