Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D8BCA0EFA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpFnJArbjAHmDwz0Ne2cWXPJLgiwsWahrSneSu6IJ9M=; b=lZGi2MgjtMN/i7
	rHi+ZEZb/fV0aXlAjkSEINgRY0FTYVTOVqvGYM7MG7A6isI+EvBuZ102fu3On0hr6mkS46pXxv1z8
	zy2Pm59BwZKJL5ax2TrBgJycj7QKwNkVcRXLlfPRbLo724eWkwrgr7zmEgO9K/5rzqWZrNM1gTHZ+
	GHHhiqbLu7rWBoNqYpoy0ie46I6CmQslhRXKlZvtMDJDvPjk5ZswOydKNQQa3BrvzNkHlj4jMc1sI
	kcYbFCVvzvx8D0N9LPr2NaRRamqu3vPlNILVeK7DJsHpE+l0nA/RxvLNLkTquyh/u9Syy8PtJzD2K
	ri5ycB2Lpoj6xtCAhqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqarH-00000008oeG-0Wbi;
	Mon, 25 Aug 2025 17:19:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaYi-00000008kH4-3Ctu;
	Mon, 25 Aug 2025 17:00:42 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-24602f6d8b6so8435925ad.1;
        Mon, 25 Aug 2025 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756141240; x=1756746040; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0oEN90SLYgvRgTxYwIkfotkQK1LJND5IDEHVs53sDg=;
        b=TLQPGRPVr4WzBh/Jv6nNWpml0os7sluryMHIzsFMFQ5e21kEpDhOsQ6j18bGPLf69f
         AmJD7CwGeizq2TvR64OGshVhA0eXwvE4xKb/a39qG0QFoaph58q/ghcJYHYdOJBr5sDP
         1+SazOARdwJm/Alty6+v3iR9Nu2q597Ba60pg8iLUnxl65gXk/+6/I2CsU2c49HaRh94
         Zx1CLsD0udaSCTPvajxs2TkR9vhYpTCJx0eBqpMWrMggVFIFok0tSfUS2rYezNGAabfk
         AQBS2n6wtWuolb+OxbecVRpdA5rUdbKQLe0ePzCOeuwnGQdQ2UtUXuKi9tVEZ70fjvFk
         oHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141240; x=1756746040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0oEN90SLYgvRgTxYwIkfotkQK1LJND5IDEHVs53sDg=;
        b=PqkLoYw4DWMkj49olp6AZNZE5zL10elQVL7cVH93/odocUn/nYTHjhoK2mkKE6xDzd
         9twU/L3qZN8LbqpEwgGh+Ar1NY2Gxp/qicKVimTFl6Vg0lddFsPpdqzw2KhxFHsg3qE2
         H7b+V0UDHyArJyoOg7oxF2O8Hoj3991s6e+CSxjN/yPNc1ulCT3qoJDw3ET44NeH0SdY
         5TcVYRVIk9NZ5p+cmRHE4pNqV6Z1v/hOIHjaapUvVXGpBhVDd9nAw7MAvwdNcwDoeaxl
         2xdiXuGaRggYdi4eOe+2ExV4EhEhzTHyLuBJkwz16Tnsu89Rs4EczqoXEOshJq4C31Jq
         a0JA==
X-Forwarded-Encrypted: i=1; AJvYcCWNsMMZxXiTWuwAv6FOXRPPQwSl5+30N3vVvT3xuHlmjmvcxV0Y0+m9CtpHikiNIFmo3Yniyk9ARcekOEM=@lists.infradead.org, AJvYcCXQ2HP+q7lHikZNxYL2WXmxZNIV585S+NtMXMLkZqRu1IezwQYj+ME7SfASA8dff2V03tX7P+01u9dz5VeLLklq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ECc6ZXf30vIeJXYCvyRhqiJgMgpDCrmXwnLGWPRntCUyhX4S
	qjmpxRYngjks/pBQjCeVLIFGS8QVWNyKMVwPMiK20kh4ZUzHZOmhvlotWu67lhyqY7J8SEEmIVB
	Gvz7PoNV0t8IlblowJyq5k5ZWOYNxcZw=
X-Gm-Gg: ASbGncuRzGcPbcGsR/zK9eXKbzJOhpb4FDaw9yzbQ2ufqPqWs4OYzRR4dClA0zHI15b
	GkLYe/I8VXDsUw/fMGIWWfMq6HlpfCqb+yAPHcg9erTnkvDvwEQiMx7i5TX61JWfGuhCJVfhMaW
	ivyZOQUw91Ue9If2hbs/968fmpwlds27gWG6KKM8fm3DpsYocEvXqITskE85R8fDdWQ4wv0SN6A
	0IsaYIh7Xr6vypLCj+/AQpNgYj20zBZR9Xl8cQSIW1+YIzHbxRkXh00nQg0YBGxG57Km98hM7Eb
	guGy04xb4qVcl82e9dIZO5CxyQ==
X-Google-Smtp-Source: AGHT+IHKT4JJBJ9rgR6CsJmxUiw1K8DlbFWihB3KfiTBy1l9WKV/JStW65ETOGMdOn/RgdA5Ko6AVAJXlO2Hf7k2FPY=
X-Received: by 2002:a17:902:cf09:b0:240:729c:a022 with SMTP id
 d9443c01a7336-24630427edbmr91627825ad.11.1756141239755; Mon, 25 Aug 2025
 10:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com> <202508250834.E2456B9@keescook>
In-Reply-To: <202508250834.E2456B9@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Aug 2025 19:00:22 +0200
X-Gm-Features: Ac12FXyYN3VEhnMM3td2GuBBEWm8dOLy6K6qZL3tvq3QOv-O5HJfG5pSFZcSTv8
Message-ID: <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>, 
	Sami Tolvanen <samitolvanen@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_100040_810759_142F3277 
X-CRM114-Status: GOOD (  13.64  )
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

T24gTW9uLCBBdWcgMjUsIDIwMjUgYXQgNTozNeKAr1BNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IFllYWgsIHRoYXQncyBhIGdvb2QgaWRlYS4gV2hhdCB0aGUgcmlnaHQg
d2F5IHRvIGRvIHRoYXQ/Cj4KPiBjb25maWcgQ0ZJX0NMQU5HCj4gICAgICAgICBib29sICJVc2Ug
Q2xhbmcncyBDb250cm9sIEZsb3cgSW50ZWdyaXR5IChDRkkpIgo+ICAgICAgICAgZGVwZW5kcyBv
biBBUkNIX1NVUFBPUlRTX0NGSQo+ICAgICAgICAgc2VsZWN0IENGSQo+Cj4gPwoKSSBkb24ndCBy
ZWNhbGwgd2hhdCBpcyB0aGUgaWRpb21hdGljIHNvbHV0aW9uIGZvciByZW5hbWVzLCBidXQgSQpy
ZW1lbWJlciBMaW51cyB0YWxraW5nIGFib3V0IHRoaXMgdG9waWMgYW5kIGFib3V0IGF2b2lkaW5n
IGxvc2luZyBvbGQKdmFsdWVzIGlmIHBvc3NpYmxlIChwZXJoYXBzIGdldHRpbmcgYSBuZXcgcXVl
c3Rpb24gaW4gYG9sZGNvbmZpZ2AgaXMKT0sgYXMgbG9uZyBhcyB0aGUgYG9sZGRlZmNvbmZpZ2Ag
cmVzcGVjdHMgdGhlIG9sZCB2YWx1ZSkuCgpJIHRoaW5rIHlvdXIgc3VnZ2VzdGlvbiBhYm92ZSB3
aWxsIHN0aWxsIG1ha2UgaXQgYXBwZWFyIHR3aWNlIGluCmBtZW51Y29uZmlnYCAtLSB0aGVyZSBt
YXkgYmUgYSB3YXkgdG8gcGxheSB3aXRoIHZpc2liaWxpdHkgdG8gbWFrZSBpdApiZXR0ZXIuCgpB
IHNpbXBsZSBwb3NzaWJpbGl0eSBJIGNhbiB0aGluayBvZiAoYXNzdW1pbmcgaXQgd29ya3MpIGlz
IGhhdmluZyB0aGUKQ0ZJIHN5bWJvbCBmb3IgdGhlIHRpbWUgYmVpbmcgaW50cm9kdWNlZCBqdXN0
IGFzIGEgYGRlZl9ib29sCkNGSV9DTEFOR2AgZm9yIGEgZmV3IHJlbGVhc2VzIHNvIHRoYXQgcGVv
cGxlIGdldCB0aGUgbmV3IG9uZSBpbiB0aGVpcgpjb25maWdzLgoKQ2hlZXJzLApNaWd1ZWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
