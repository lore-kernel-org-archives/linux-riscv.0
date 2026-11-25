Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF79606A323
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a8k7RkpK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSe8OYbd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d4f88lDIgpxjxu2oxK+jkW6CHzYV6Jopk8XaZ11uFvo=; b=a8k7RkpKzaJsPp9yo7k5WusoyZ
	1iQgBTayrtk1CvtrBe9BQyg75txj9VktoA/0LUCE6AwtM4e9/jNdbF+sLUNMYduR6mlPbKGA5hahU
	5DqJaaptCbwNph9XUvBJgvcPP6F5mkUU0T5wfPUCk9L86IMXV2IbsvLu2ml7KmBiX9ySe/v5bu3rt
	VCkRLnaWrXebXLpvUQG5JtavWMgusLBa/ljwh0qLOWIVVtK/JcbEWAUYObeKnf34mbaLx1ZUwBvzX
	kbYziHlt3nxt6n0hqhMXi+L7oRn9q6RoczgzZEyl6xZPIpNc860ZzymyYvelDHROrMxmKuZt2KE2A
	vQoYEw5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9U2-00000009LMF-17AJ;
	Wed, 25 Nov 2026 09:40:10 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Sm-00000009L6H-2feK
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 09:40:08 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3863db981d4so7731071eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 01:38:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795599530; cv=none;
        d=google.com; s=arc-20260327;
        b=Mrpo6or+Y1GiIsNa5pAZ6Td1D8fJndn51cdlA5Sn2uk0bKv8SBfBN8R2e7XfX3vfw2
         Dlk19H4sxFG8uVYh/SOttCrJprGV4MU4D4hqXrkuT6PqGuJhO3MwW4sXqgohQSohuYt2
         sc4JOpDbsUYE+3Zm575tWHtsiv2HpURFEFR6rmfN2JHWTfhdbQ2AUlXgmN2sjsrKUyeC
         RJ5W/AScMNIEYAHwAjopFBTJVQ+nblzsCMOkiJSeBRq0+CdTyTKh4I7eHpzHM9op9DPd
         vkxtbGUVXT1x2FK9eAAby08epXykMvX4Hswd8gPfV+TXO9F5aRHAJi3JO/EKM/mkVU7l
         1Vow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqT5zEBe4POq8VjpsxwmrndRyPW+0T4pOR/YbSlCbVY=;
        fh=AheY/NXiigwwz7btLdqCEmfyD96ufBmgqgYd6UkbTQk=;
        b=bseDeBTZq57eRUSq7F4cwDakTpE05dnX3H3oChVnHeurxk1ZoAvDa2QVd/rcgBQZ1e
         OQmCyv0NsmqnoGSZ8jx+nH4PF6Fmwp1n3ZLkUl8MwjQyJ30hQ9rScKi3PPuxbQMGOUrj
         zBXAsLRBIgZQfn/cpmlH2obVBq74awWR1b1LYimpQb3lfJ7UK7g220LA63QUEvUYuBu3
         ISQ7G6kH1bHxP24Dkma31rguoN5/aKhSp5DaHQlz1sktwK419Y8H768o/dStFC4wH1if
         30P3dq4sm5NBg0ZBrCYZH1Q5gUHgoqPTRZucUwYJ0tqoKWWm92YtMsqTd5b+YVDbidLI
         t7sg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599530; x=1796204330; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqT5zEBe4POq8VjpsxwmrndRyPW+0T4pOR/YbSlCbVY=;
        b=MSe8OYbd81mczl7HpT2qwOeriiQWXfUmcFyvjzGO2xu2JiVwhO2s98TFIKQatDxlW1
         gSygMOwLMF8uGp05aXu6pJRJCw+xZv+s6zFZqPtV8N+urHK6nkSWKB3BE+bbZicJZoyX
         TGeRIgBSj5qlB6ufMf7zhIPnHhOjbiDXDvjqiYcsotENQG0atsIXdqLhkb70stUwAZkg
         1VeLZMrGz59jXXVjP02UUpcOcS5hdzqu0gl7ftrMlFW7LIff4/MJfR4BkRDpxv3ghIYN
         4KBnczibkAO/AvOkZ978w/QhT0uhLC51sB/TtVqwhNRiHkX746TWcTVxpVwoz9VOUsVU
         ukPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599530; x=1796204330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqT5zEBe4POq8VjpsxwmrndRyPW+0T4pOR/YbSlCbVY=;
        b=I0I7i1AO6DJDurVoywpjz+MAAjibXFWtK97s01Qj9eL70SPxLNcNByd2E3/wDo7GGZ
         JhkRaMyiPS4PeUbP6PX02+/h8zn6VsNHPLE2HH6xt1qyp4Dx9B/Q/C7YKtNscELLdgeK
         XUNQHsROrHL5jZKYBeQ2P4AZBvcrTvx7ATPQWWbWFLiFVpJr1Y12JNt8XUuzIKLuAOrV
         81MvNMrlyRU0TExny6eKwoGCjJDNGZ2v7HmWwba75gOp3UJB20xP4kMMca2ZKMo1ln1F
         eAGqvvHbou19gJmndVqHTTTZIyYMwScGwdf1HN+yrsPVXNX9gANxmtxByY1bfyuEBxmH
         WaUg==
X-Forwarded-Encrypted: i=1; AL+hErFdSehlS/LmkBHIHyft6oQpco6+YmQ0/PaNuKr6uU2GO38aHRvQPD0iTC7WRrVf2c0FH+C8yGzmjRu5pg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8kxlckBdLpiLuO9nJJiuMb47jsUR82pZUAp1EB2uM/E4HRD+iE
	vhNC60J2HXlFDglHZN1ExR7JKHAls0KCd1EUtCNwEwibFk3DPvXBaFcJoB6t1HMautCbIpVoaF4
	uehZ85EUzp43RiLP3a0kAYQXsYFAszwQ=
X-Gm-Gg: AZFdTZcR8+VZvWLJg+NYIUb2xcwz04hZdJiJGgW5FDKDh6XpgZ05QprpmpMg4yTgMmU
	OCQ6m5nrX/NDrvnuQbNjFfInfLDBR3Wp0V3TyPpZ+u9pO9FVaig90x+qzS0wXN1VsWtrUTEFKxg
	F81wuAntAK6Bj/4/mouh3MoqgRkvRWFNyIItN1S68WXY127FjnnLKLfqfQ5NfptOjiFLMOxqfWY
	B2SidqNHVglBfTo+Qi9ZfjVen4OqNQYDC6ESPjjp4oau8xSDXzMXeraiAAmVyCO2boo3yFsPk6Z
	RWyzrxRDKAQVWMOLKJGfgisemr5XJVQU9VdhYlVwHn+d34rprqaKcpp2DM3nORBCJoyua3qn/Gk
	5+P+dqOEXvw52pzjCN+7zi6hSI15XtPKkZaM=
X-Received: by 2002:a05:7301:6184:20b0:386:b006:c8 with SMTP id
 5a478bee46e88-386b0060806mr9187564eec.35.1795599530462; Wed, 25 Nov 2026
 01:38:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net> <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
 <awXUSuYOUQMPCl-5@aurel32.net> <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
In-Reply-To: <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Wed, 25 Nov 2026 17:38:38 +0800
X-Gm-Features: Aa3M54qi331g5vW8-jVNPAgzGNvq1anSty0Xye8n492lYEY0Eqku4rqKabs__f8
Message-ID: <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Anand Moon <linux.amoon@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_013852_801815_2EC96ACE 
X-CRM114-Status: GOOD (  35.68  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQW5hbmQsCgpPbiBXZWQsIE5vdiAyNSwgMjAyNiBhdCAzOjUy4oCvUE0gQW5hbmQgTW9vbiA8
bGludXguYW1vb25AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEF1cmVsaWVuLAo+Cj4gT24gV2Vk
LCAyNSBOb3YgMjAyNiBhdCAwMDoxNCwgQXVyZWxpZW4gSmFybm8gPGF1cmVsaWVuQGF1cmVsMzIu
bmV0PiB3cm90ZToKPiA+Cj4gPiBIaSBaaXhpYW4sCj4gPgo+ID4gT24gMjAyNi0xMS0yNCAxMToz
MSwgWml4aWFuIFplbmcgd3JvdGU6Cj4gPiA+IEhpIEF1cmVsaWVuLAo+ID4gPgo+ID4gPiBPbiAy
MDI2LzExLzI0IDU6NTgsIEF1cmVsaWVuIEphcm5vIHdyb3RlOgo+ID4gPiA+IEhpLAo+ID4gPiA+
Cj4gPiA+ID4gT24gMjAyNi0xMS0yMyAxMjo0MSwgWml4aWFuIFplbmcgd3JvdGU6Cj4gPiA+ID4g
PiBUaGUgYmFuYW5hcGktZjMgY2FycmllcyBhbiBBVDI0QzAyIGNvbXBhdGlibGUgRUVQUk9NIEdU
MjRDMDJCIFsxXToKPiA+ID4gPiA+IDI1NiBieXRlcyB3aXRoIGFuIDgtYnl0ZSB3cml0ZSBwYWdl
LCB3aGljaCBjYW4gYmUgZm91bmQgaW4gc2NoZW1hdGljWzJdLgo+ID4gPiA+ID4gVGhlIGRldmlj
ZSB0cmVlIGRlY2xhcmVzIHBhZ2VzaXplID0gPDE2Piwgd2hpY2ggZG9lcyBub3QgbWF0Y2ggdGhl
Cj4gPiA+ID4gPiBlZXByb20gY2hpcCBkYXRhc2hlZXQgd2hpY2ggZGVjbGFyZXMgcGFnZXNpemUg
OCBieXRlcy4KPiA+ID4gPgo+ID4gPiA+IE9vcHMsIEkgYW0gbm90IHN1cmUgaG93IEkgZ290IHRo
YXQgd3JvbmcuIFNvcnJ5IGFib3V0IHRoYXQuCj4gPgo+ID4gVGhlIHF1ZXN0aW9uIG9mIHRoZSBw
YWdlIHNpemUgaGFzIGJlZW4gcmFpc2VkIGluIHRoZSBpbml0aWFsIHJldmlldyBbMV0sCj4gPiBh
bmQgaXQgc2VlbXMgdGhhdCB0aGUgR1QyNEMwMiBoYXMgYSAxNi1ieXRlIHBhZ2Ugc2l6ZSwgd2hp
bGUgdGhlCj4gPiBHVDI0QzAyQiBbMl0gaGFzIGEgOC1ieXRlIHBhZ2Ugc2l6ZS4gVGhlIEJQSS1G
MyBzY2hlbWF0aWNzIGNvbmZpcm1zIHRoYXQKPiA+IHRoZSBCIHZlcnNpb24gaXMgdXNlZC4gU29y
cnkgYWJvdXQgdGhlIG1pc3Rha2UuCj4gPgo+ID4gPiA+ID4gRUVQUk9NIHBhZ2VzaXplIG9mIGsx
LWJhbmFuYXBpLWNtNi1pb1szXSBhbmQgazEtb3JhbmdlcGktcnYyWzRdIGNoYW5nZWQKPiA+ID4g
PiA+IHRvZ2V0aGVyLCBiYXNlZCBvbiB0aGUgY2hpcCBtb2RlbCBzaG93biBpbiB0aGUgc2NoZW1h
dGljIGRpYWdyYW0uCj4gPiA+ID4KPiA+ID4gPiBUaGUgazEtbWlsa3YtanVwaXRlciBib2FyZCBp
cyBhbHNvIGFmZmVjdGVkIHdpdGggdGhlIHNhbWUgaXNzdWUsIGRlc3BpdGUKPiA+ID4gPiB1c2lu
ZyBhIHNsaWdodGx5IGRpZmZlcmVudCBFRVBST00gKDI0QzA0KS4KPiA+ID4gPgo+ID4gPgo+ID4g
PiBUaGUgR1QyNEMwNEEgRUVQUk9NIHVzZWQgb24gazEtbWlsa3YtanVwaXRlciBib2FyZCBkb2Vz
bid0IHNlZW0gdG8gaGF2ZQo+ID4gPiB0aGUgc2FtZSBpc3N1ZSwgd2hpY2ggeW91IGNhbiBmaW5k
ICJQYWdlIFNpemU6IDE2IGJ5dGVzIiBpbiBkYXRhc2hlZXQ6Cj4gPiA+IGh0dHBzOi8vd3d3Lmdp
YW50ZWMtc2VtaS5jb20vdXBsb2Fkcy8yMDIyMDkyOS9HVDI0QzA0QS5wZGYKPiA+Cj4gPiBJbmRl
ZWQgeW91IGFyZSBjb3JyZWN0LCBhbmQgSSBjb25maXJtIHRoYXQgdGhpcyBpcyB0aGUgZXhhY3Qg
dmVyc2lvbgo+ID4gdXNlZCBvbiB0aGUgc2NoZW1hdGljcy4gVGhlcmVmb3JlIHRoZXJlIGlzIG5v
IG5lZWQgdG8gZXh0ZW5kIHlvdXIgcGF0Y2gsCj4gPiBpdCBjYW4gYmUgbWVyZ2VkIHRoYXQgd2F5
Lgo+ID4KPiA+ID4gQnV0IEkgZG9uJ3QgaGF2ZSB0aGUgYm9hcmQsIHNpbXBsZSB0ZXN0IHdvdWxk
IGJlIGFwcHJlY2lhdGVkLiBQZXJoYXBzIEkKPiA+ID4gc2hvdWxkIGluY2x1ZGUgdGVzdCBzdGVw
cyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgZm9yIHRoZSBuZXh0IHJldmlzaW9uLgo+ID4KPiA+IFVu
Zm9ydHVuYXRlbHkgdGhlIGJvYXJkIGhhcyB0aGUgRUVQUk9NIHdyaXRlIHByb3RlY3Rpb24gcGlu
IGNvbm5lY3RlZCB0bwo+ID4gVkNDLCB3aGljaCBtZWFucyB0aGUgd3JpdGUgcHJvdGVjdGlvbiBp
cyBlbmFibGVkLiBUaGVyZWZvcmUgdGVzdGluZyBpcwo+ID4gbm90IHNvIGVhc3kuCj4gPgo+ID4g
UmVnYXJkcwo+ID4gQXVyZWxpZW4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvYU5MelJKY0tDWU9uZ2M3ekBhdXJlbDMyLm5ldC8KPiA+IFsyXSBodHRwczov
L3d3dy5naWFudGVjLXNlbWkuY29tL2p1Y2hlbjExMjMvdXBsb2Fkcy9wZGYvR1QyNEMwMl9EU19B
dS5wZGYKPiA+Cj4gQXBvbG9naWVzLCB0aGlzIGlzIGEgZGlmZmVyZW50IGlzc3VlLgo+Cj4gSSBh
bSBjdXJyZW50bHkgd29ya2luZyBvbiBlbmFibGluZyBtdWx0aS1EVEIgc3VwcG9ydCBpbiBVLUJv
b3QgU1BMCj4gZm9yIFNwYWNlbWlUIEsxIGJvYXJkcy4KPgo+IFdoaWxlIGludmVzdGlnYXRpbmcg
dGhlIGJvYXJkIGRldGVjdGlvbiBpc3N1ZSwgSSBub3RpY2VkIHRoYXQgdGhlIEVFUFJPTQo+IG9u
IG15IEJhbmFuYSBQaSBCUEktRjMgZG9lcyBub3QgY29udGFpbiBhIFByb2R1Y3QgTmFtZSBUTFYg
ZW50cnkuCj4KPiBhbGFybUBrMTp+JCBzdWRvIGhleGR1bXAgLUMgL3N5cy9idXMvaTJjL2Rldmlj
ZXMvMi0wMDUwL2VlcHJvbQo+IDAwMDAwMDAwICA1NCA2YyA3NiA0OSA2ZSA2NiA2ZiAwMCAgMDEg
MDAgMjAgMjQgMDYgZmUgZmUgZmUgIHxUbHZJbmZvLi4uICQuLi4ufAo+IDAwMDAwMDEwICBkNSA1
MiBiZCAyYSAwMiAwMCAwMiAyMyAgMGMgMzkgMzggNjEgMzkgNjMgMzMgNjEgIHwuUi4qLi4uIy45
OGE5YzNhfAo+IDAwMDAwMDIwICAzMiA2MiA2NCAzNCAzNyBmZSAwNCAzYiAgZTMgZmYgYmQgZmYg
ZmYgZmYgZmYgZmYgIHwyYmQ0Ny4uOy4uLi4uLi4ufAo+IDAwMDAwMDMwICBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIHwuLi4uLi4uLi4uLi4uLi4ufAo+
ICoKPiAwMDAwMDEwMAo+Cj4gQWx0aG91Z2ggdGhlIEVFUFJPTSBpcyByZWFkYWJsZSwgdGhlIG1p
c3NpbmcgUHJvZHVjdCBOYW1lIFRMViBlbnRyeQo+IGV4cGxhaW5zIHdoeSByZWFkX3Byb2R1Y3Rf
bmFtZSgpIHJldHVybnMgYC1FTk9FTlRgICgtMiksIGFzc3VtaW5nIHRoZQo+IEVFUFJPTSByZWFk
IGFuZCB2YWxpZGF0aW9uIHN1Y2NlZWQuCj4KPiBDb25zZXF1ZW50bHksIGF1dG9tYXRpYyBib2Fy
ZCBkZXRlY3Rpb24gZmFpbHMsIGFuZCBVLUJvb3QgZmFsbHMgYmFjayB0bwo+IENPTkZJR19ERUZB
VUxUX0RFVklDRV9UUkVFLCB3aGljaCBtYXkgc2VsZWN0IGFuIGluY29ycmVjdCBkZXZpY2UKPiB0
cmVlIGZvciB0aGUgdGFyZ2V0IGJvYXJkLgoKWWVzLCBleGFjdGx5LiBJIGVuY291bnRlcmVkIHRo
ZSBzYW1lIHByb2JsZW0uIEJvYXJkIGRldGVjdCBmYWlsZWQgYW5kIHRoZW4gdXNlZApkZWZhdWx0
IGRldmljZSB0cmVlIChNdXNlUGkgUHJvKS4KCj4gU2luY2UgdGhlIFNEIGNhcmQtZGV0ZWN0IEdQ
SU8gcG9sYXJpdHkgZGlmZmVycyBiZXR3ZWVuIHRoZSBCYW5hbmEgUGkgQlBJLUYzCj4gYW5kIE11
c2VQaSBQcm8sIHNlbGVjdGluZyB0aGUgaW5jb3JyZWN0IGRldmljZSB0cmVlIGNhbiByZXN1bHQg
aW4gU0QKPiBjYXJkIGRldGVjdGlvbgo+IGFuZCBib290IGZhaWx1cmVzLgo+Cj4gVGhlIGZvbGxv
d2luZyBTUEwgYm9vdCBsb2cgc2hvd3MgdGhlIGJvYXJkIGRldGVjdGlvbiBmYWlsdXJlLCBhbHRo
b3VnaAo+IEREUiBpbml0aWFsaXphdGlvbiBjb21wbGV0ZXMgc3VjY2Vzc2Z1bGx5Ogo+Cj4gYGBg
Cj4gVS1Cb290IFNQTCAyMDI2LjEwLTAxMDYwLWdmMzA4MGFiY2ZlOTItZGlydHkgKE9jdCAyNCAy
MDI2IC0gMTc6MzA6MDMgKzA1MzApCj4gRmFpbCB0byBkZXRlY3QgYm9hcmQ6LTIKPiB2ZGRfY29y
ZSwgdmFsdWU6OTAwMDAwCj4gdmRkXzF2OCwgdmFsdWU6MTgwMDAwMAo+IHZkZF8xdjhfbW1jLCB2
YWx1ZToxODAwMDAwCj4gRERSIGZpcm13YXJlOiBbMHhjMDgyMDkwMF06MHhmMDIyNzE3OSwgc2l6
ZToweDhkOTgKPiBERFIgaXMgcmVhZHkKPiBgYGAKPiBDb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0g
d2hldGhlciB0aGUgUHJvZHVjdCBOYW1lIFRMViBlbnRyeSBpcwo+IGV4cGVjdGVkIHRvIGJlIHBy
b2dyYW1tZWQgaW50byB0aGUgRUVQUk9NIGR1cmluZyBtYW51ZmFjdHVyaW5nPwoKWWVzLCBObyBw
cm9kdWN0IG5hbWUgVExWIGVudHJ5IGluIG15IEJhbmFuYXBpLWYzIEVFUFJPTS4gVGhhdCdzIHRo
ZSByZWFzb24KSSB3YW50ZWQgdG8gd3JpdGUgRUVQUk9NIGFuZCBmb3VuZCB0aGlzIEVFUFJPTSBw
YWdlc2l6ZSBpc3N1ZS4KCj4gQWxzbywgaXMgdGhlcmUgYSByZWNvbW1lbmRlZCBhcHByb2FjaCBm
b3IgaGFuZGxpbmcgYm9hcmRzIHdpdGggbWlzc2luZwo+IHByb2R1Y3QgaW5mb3JtYXRpb24gaW4g
dGhlIEVFUFJPTSB0byBlbnN1cmUgcmVsaWFibGUgYXV0b21hdGljIGRldmljZQo+IHRyZWUgc2Vs
ZWN0aW9uPwoKSSdtIG5vdCBzdXJlLiBDdXJyZW50bHksIGFmdGVyIEkgY29ycmVjdGVkIHBhZ2Vz
aXplLCBJIHdyb3RlIEVFUFJPTSBtYW51YWxseToKYGBgClUtQm9vdCBTUEwgMjAyNy4wMS1yYzIt
MDAwMzktZzRjZmY1MGY0MDM0MwpHZXQgYm9hcmQgbmFtZTprMS14X2RlYjEKdmRkX2NvcmUsIHZh
bHVlOjkwMDAwMAp2ZGRfMXY4LCB2YWx1ZToxODAwMDAwCkREUiBmaXJtd2FyZTogWzB4YzA4MWRm
ODBdOjB4ZjAyMjcxNzksIHNpemU6MHg4ZDk4CkREUiBpcyByZWFkeQpObyBTUEkgY29udHJvbGxl
ciAoLTE5KQpUcnlpbmcgdG8gYm9vdCBmcm9tIE1NQzIKLi4uLgo9PiB0bHZfZWVwcm9tClRMVjog
MApUbHZJbmZvIEhlYWRlcjoKICAgSWQgU3RyaW5nOiAgICBUbHZJbmZvCiAgIFZlcnNpb246ICAg
ICAgMQogICBUb3RhbCBMZW5ndGg6IDI5ClRMViBOYW1lICAgICAgICAgICAgIENvZGUgTGVuIFZh
bHVlCi0tLS0tLS0tLS0tLS0tLS0tLS0tIC0tLS0gLS0tIC0tLS0tCkJhc2UgTUFDIEFkZHJlc3Mg
ICAgIDB4MjQgICA2IEZFOkZFOkZFOjkwOjFFOkYwClByb2R1Y3QgTmFtZSAgICAgICAgIDB4MjEg
ICA5IGsxLXhfZGViMQpNQUMgQWRkcmVzc2VzICAgICAgICAweDJBICAgMiAyCkNSQy0zMiAgICAg
ICAgICAgICAgIDB4RkUgICA0IDB4QTg4QzkzRjAKYGBgCk1heWJlIHdlIGNhbiBkaXNjdXNzIHRo
aXMgaW4gdS1ib290IG1haWxsaW5nIGxpc3Q/IFRoaXMgaXMgaW5kZWVkIGEKc2VwYXJhdGUgaXNz
dWUuCgpCZXN0IHJlZ2FyZHMsClppeGlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
