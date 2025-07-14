Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A553C83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5/CA/iWOZcgBJJgL6+z+aCj5e2fnpcil4366wuAS5w=; b=AySV8Dw3Mwrlob
	Y7EpRQWjeq5fM9aQYdv3zenqQWk0XEB/L8sshYvt95yHgYF0IOh+cHkpDHC4A98ac5vSlq8As2zLc
	sV24WMVselPsPWc4NNVCycwEb0SQPx0Hj4uRkVo8W/SDUfMbAxjXF+UtzjVgLB2udxaXxj1aQ9m02
	ElKlJzm3fsAp/BthOJrcefDfimVuUC0ir9UEjojDTscIKu0cKYL6Qwkgeu/MxozK9VPxImGBfucv0
	I5JntOXb/USOKsiQCOJ6BaUdjBmABEs+vI2f+je+EiAauwEMry0C2rJiSbntc19r65fJrznkdkXDP
	TJ0w82OgtxuGWuI/JiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFt-000000034Zt-3pIl;
	Mon, 14 Jul 2025 18:50:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubN3i-00000002yCy-3iBa
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 17:33:48 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2110597f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752514425; x=1753119225; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K3B0b5V93YPfWe1+3AICKSgs3ptzNkqsIklSYx0fG0M=;
        b=uY8sqA+CNWbvjsj1tQbIS6t7YdGkgAKi88FNt9rBGoMq8ZKIr4hAuORzaDDLmxYARu
         caUQJzZlUJ7uDcCPDP11y8z+UBdeYq/KhYSegZne8Ud6HqJOXeQ+oDWPxCFgpHPrOMbt
         u8OQdNMN9hIpuSH/t3KUU9yoorq/wMKMy8+U+dJ0NAMRILKi+byuHNNqi5LjPCoas2DU
         gJ8ywA4KZqHTRGtsnaHLNcQ+QKHPp53gmCDHzP3C18+lV+HnROlAQdK84XfBb5653RN4
         TcuSXeAz0VKPLr5KqQlmatXFLNYt7aZOv3rCV71BEdBW8BMJ9uZJC4ywE749v6GdYMCu
         vJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514425; x=1753119225;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3B0b5V93YPfWe1+3AICKSgs3ptzNkqsIklSYx0fG0M=;
        b=HczbuSjT6P4wPkV9xN5BaIGS/ZUbNkFLHgqPhcr/qEV3alfYoR21jwPZPiIkH4p6dY
         mPqgMn8dpHc9VM13l5YTbzH2HoqWkBcEYFoEzqJx4tTJIz8XKtOaM+kkr28KwMeBVlJS
         jfbtN73rZ1za67RXvw5wwnqA99aHnW7eJB5corkMizvYFyqjgI61V7EiJHOkhDWvy1MP
         kzL4jUGE3MyU4UNuMV/F3xuDlkuZTB1IrBfPfPFcFY89XiHL4AJkZLFK78XfKsg4AAA8
         Y0jw/Wkr6/wJUAwHqjQmz87/eMHAJMTnfNDzgFL+UrvXkIMdk3vNNd7kdmPPteyiItwD
         xwLw==
X-Gm-Message-State: AOJu0YyJci/yJd2ubwvGHv0tBOF4DyKG7vD+KJnZsp02weiUsA9XMSWb
	WpY6ytSkSfTVud0fAdYgCyT7r8o2OxGc0bEJDF+q6+s1V4Zf4k/Rgy5Di0JqgtJeIi8=
X-Gm-Gg: ASbGncsj86CUyTNcbR7o+HHN6qlsC450gVvKAU0MkBjVfl0+Rc6yd04m7RrwrPmOGIR
	AhStgshgf02KWCDHEQXC7smwT60JQQx/4Vo0I+muqUv7q3UMhN7QnlyNzM9XCP6IzEciQpaRFN2
	hlD1PSv7O/qQ/tV7MAZ5pbaI8xCZCz1QXDkExcrcHlqs6NcC6fZV7vcwdt5rYGq5cn9P+Ha1Gqd
	UyYeW2AjDOp2r1NVUdKvI6345TpkhMj4JEaZq32HRwVhJckNXAwIul9aly/6ZsJxGG4uudRQgG2
	gFGMTmXwa0pVSDR4H3zkNP1vqn/UM4JJGPN5Ar/3S2hCL18dsHG1M9rkFauvsSBcnkfh5+SxtZj
	fmcJMV3mjGJoivUUHnOgKer6QW3SRBIKSwswH3unNFH+J/GtnIU+Acrkt7oQAVFRYtqBrW2U=
X-Google-Smtp-Source: AGHT+IH6DuVDTWjH8LEfRHqsJ7nnwbcR5WRp178UvNoIH9ZWv7Jkfjb9l03elkaMQ2JI0lQcObxBKQ==
X-Received: by 2002:a05:6000:440d:b0:3a4:dd8e:e16b with SMTP id ffacd0b85a97d-3b5f187eeebmr8615893f8f.20.1752514425297;
        Mon, 14 Jul 2025 10:33:45 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032e9esm177642255e9.3.2025.07.14.10.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:33:44 -0700 (PDT)
Date: Mon, 14 Jul 2025 19:33:42 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Jesse Taube <mr.bossman075@gmail.com>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v6] clocksource/drivers/timer-clint: Add T-Head C9xx clint
Message-ID: <aHU_dhOSoZawi7J9@mai.linaro.org>
References: <20250623231536.1120282-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623231536.1120282-1-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_103346_928997_48E2520D 
X-CRM114-Status: GOOD (  23.76  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgMDc6MTU6MzZQTSAtMDQwMCwgSmVzc2UgVGF1YmUgd3Jv
dGU6Cj4gRnJvbTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IAo+IFRvIHVz
ZSB0aGUgVC1IRUFEIEM5eHggY2xpbnQgaW4gUklTQ1YtTSBOT01NVSBlbnYsIHdlIG5lZWQgdG8g
dGFrZQo+IGNhcmUgdHdvIHBvaW50czoKPiAKPiAxLlRoZSBtdGltZWNtcCBpbiBULUhlYWQgQzl4
eCBjbGludCBvbmx5IHN1cHBvcnRzIDMyYml0IHJlYWQvd3JpdGUsCj4gaW1wbGVtZW50IHN1Y2gg
c3VwcG9ydC4KPiAKPiAyLiBBcyBwb2ludGVkIG91dCBieSBjb21taXQgY2E3ODEwYWVjZGJhICgi
bGliOiB1dGlscy90aW1lcjogbXRpbWVyOgo+IGFkZCBhIHF1aXJrIGZvciBsYWNraW5nIG10aW1l
IHJlZ2lzdGVyIikgb2Ygb3BlbnNiaToKPiAKPiAiVC1IZWFkIGRldmVsb3BlcnMgc3VyZWx5IGhh
dmUgYSBkaWZmZXJlbnQgdW5kZXJzdGFuZGluZyBvZiB0aW1lIENTUiBhbmQKPiBDTElOVCdzIG10
aW1lIHJlZ2lzdGVyIHdpdGggU2lGaXZlIG9uZXMsIHRoYXQgdGhleSBkaWQgbm90IGltcGxlbWVu
dAo+IHRoZSBtdGltZSByZWdpc3RlciBhdCBhbGwgLS0gYXMgc2hvd24gaW4gb3BlbkM5MDYgc291
cmNlIGNvZGUsIHRoZWlyCj4gdGltZSBDU1IgdmFsdWUgaXMganVzdCBleHBvc2VkIGF0IHRoZSB0
b3Agb2YgdGhlaXIgcHJvY2Vzc29yIElQIGJsb2NrCj4gYW5kIGV4cGVjdHMgYW4gZXh0ZXJuYWwg
Y29udGlub3VzIGNvdW50ZXIsIHdoaWNoIG1ha2VzIGl0IG5vdAo+IG92ZXJyaWRlYWJsZSwgYW5k
IHRodXMgbXRpbWUgcmVnaXN0ZXIgaXMgbm90IGltcGxlbWVudGVkLCBldmVuIG5vdCBmb3IKPiBy
ZWFkaW5nLiBIb3dldmVyLCBpZiBDTElOVEVFIGlzIG5vdCBlbmFibGVkIGluIFQtSGVhZCdzIE1Y
U1RBVFVTCj4gZXh0ZW5kZWQgQ1NSLCB0aGVzZSBzeXN0ZW1zIHN0aWxsIHJlbHkgb24gdGhlIG10
aW1lY21wIHJlZ2lzdGVycyB0bwo+IGdlbmVyYXRlIHRpbWVyIGludGVycnVwdHMuIFRoaXMgbWFr
ZXMgaXQgbmVjZXNzYXJ5IHRvIGltcGxlbWVudCBULUhlYWQKPiBDOXh4IENMSU5UIHN1cHBvcnQg
aW4gT3BlblNCSSBNVElNRVIgZHJpdmVyLCB3aGljaCBza2lwcyBpbXBsZW1lbnRpbmcKPiByZWFk
aW5nIG10aW1lIHJlZ2lzdGVyIGFuZCBmYWxscyBiYWNrIHRvIGRlZmF1bHQgY29kZSB0aGF0IHJl
YWRzIHRpbWUKPiBDU1IuIgo+IAo+IFNvLCB3ZSBuZWVkIHRvIGZhbGwgYmFjayB0byByZWFkIHRp
bWUgQ1NSIGluc3RlYWQgb2YgbXRpbWUgcmVnaXN0ZXIuCj4gQWRkIHJpc2N2X2Nzcl90aW1lX2F2
YWlsYWJsZSBzdGF0aWMga2V5IGZvciB0aGlzIHB1cnBvc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEplc3Nl
IFRhdWJlIDxNci5Cb3NzbWFuMDc1QGdtYWlsLmNvbT4KPiAtLS0KPiBUcmVhdCB0aGlzIGFzIGEg
Y29tcGxldGVseSBuZXcgcGF0Y2gsIGFzIGl0IGlzIG1vc3RseSByZXdyaXR0ZW4uCj4gT3JpZ2lu
YWw6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNDEwMTQyMzQ3Ljk2NC0zLWpz
emhhbmdAa2VybmVsLm9yZy8KPiBWMyAtPiBWNDoKPiAgLSBBZGQgcmlzY3YsY3NyLWNsaW50Cj4g
IC0gQWxsb3cgdXNpbmcgb2YgQ1NScyBpbiBTIG1vZGUKPiAgLSBDaGFuZ2UgaWYgcmV0dXJuIGVs
c2UgcmV0dXJuIHRvIGlmIHJldHVybiByZXR1cm4KPiAgLSBDaGFuZ2Ugc3RhdGljX2JyYW5jaF9s
aWtlbHkgdG8gc3RhdGljX2JyYW5jaF91bmxpa2VseQo+ICAtIEZpeCAzMi1iaXQgY2xpbnRfZ2V0
X2N5Y2xlczY0IGNzcl9hdmFpbGFibGUgY2hlY2sgYmVpbmcgaW52ZXJ0ZWQKPiAgLSBGaXggaXNf
YzkwMF9jbGludCBiZWluZyB1bmluaXRpYWxpemVkCj4gVjQgLT4gVjU6Cj4gIC0gUmVtb3ZlIHJp
c2N2LGNzci1jbGludAo+ICAtIFJlbW92ZSByaXNjdl9jc3JfdGltZV9hdmFpbGFibGUKPiAgLSBS
ZXBsYWNlIGFsbCBzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZyaXNjdl9jc3JfdGltZV9hdmFpbGFi
bGUpIHdpdGgKPiAgICAgcmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHkoUklTQ1ZfSVNBX0VYVF9a
SUNOVFIpCj4gVjUgLT4gVjY6Cj4gIC0gQWRkIGNzcl9jbG9ja19uZXh0X2V2ZW50Cj4gIC0gQWRk
IGNzcl9nZXRfY3ljbGVzNjQgdG8gc2NoZWRfY2xvY2tfcmVnaXN0ZXIKPiAgLSBCcmVhayBnZXRf
Y3ljbGVzNjQgaW50byBjc3JfZ2V0X2N5Y2xlczY0IGFuZCBjbGludF9nZXRfY3ljbGVzNjQKPiAg
LSBDaGFuZ2UgZGVmYXVsdCBiZWhhdmlvciB0byB1c2UgQ1NSIHRpbWUgcmVnaXN0ZXIKPiAKPiBQ
b3NpYmxlIGZ1dHVyZSB3b3JrOgo+ICAtIENoZWNrIGZvciBTU1RDIHN1cHBvcnQgYW5kIHVzZSBz
dGltZXJjbXAKPiAgLSBTU1RDIGRlcGVuZHMgb24gc21vZGUgd2hpY2ggY3B1ZmVhdHVyZSBkb2Vz
bnQgY2hlY2sgZm9yLgo+IC0tLQoKSSB3b3VsZCBsaWtlIHRvIGhhdmUgQW51cCBQYXRlbCBvcGlu
aW9uIG9uIHRoZXNlIGNoYW5nZXMKCiAgLS0gRGFuaWVsCgotLSAKCiA8aHR0cDovL3d3dy5saW5h
cm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0Nz
CgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4g
RmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8Cjxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
