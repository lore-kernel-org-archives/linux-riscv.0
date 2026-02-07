Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487C5EE6B70
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 02:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csSPX66hbCGcrkWVu17uI5nnhS2EQIax4F4m6/1pYAk=; b=UQjCK/oH3MV8t6
	6O+brv7YLEDfAeeD2I4IS6lzS+UbBxLKK5NATGOkzGt7vjAIlSrXte3rWrb0SQfZzC3tmxwh6FMrh
	lEMi2tM2o85ksUQ131RO67t9RcI912fsZk/Yie6SaBhiHT/hPRNSIlWjDLONTjHHnO9TkCqz2J/Jo
	ZOg7RnDP6avE/YX7PHAiO+u46ufOorpyifOmGi5KQuWZByeTlovMoDo1tSm18w+8F1j7kME+Lxkdb
	GELWNPci94oi5NH7T9yhdgEh1luHsptKCHgfxJ69d+7bVPTHRf3zt8xw33ToFd3R9yhD2+A0IUfXa
	dRkFdlKQlFedC/z7KelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voXnt-0000000C2QR-1vUO;
	Sat, 07 Feb 2026 02:12:09 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voXnq-0000000C2Q4-0diE
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 02:12:07 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b8e526081ceso95865366b.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 18:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770430323; cv=none;
        d=google.com; s=arc-20240605;
        b=jX3PbUkFeVOzNFk6h9i/ilT+Wz5fHg3b8PzRG1TD1AKNk8+C9p7XtGAS2EnqVhwemJ
         laA5sGFTNyZ0xuVPm5XPSFtv36KnKl6K8rxybKg25uqpFnFn8MG+exF7OXnwzANvWTn6
         GRcFIU5TGfPEB39WGpK6l8xgu1bOsHJfJz2N+HYF1AFBsrMHFJFN/a1kOQUfGwBW9MWy
         rWd/PWmIE4chpRYEYRkLHd1aH0lzDca6H2VPC3rca60QparFrlIwytAbD1Fgz5JONVPl
         AuXVFNSjTfdRlIH+psyDTP5/NynXHx/W5hVCdT5L+2LYcQFfTljiVmwplMMqMd/j2ir9
         74sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xVXJfBkOf++utzjym33J9FgN5u0L0gqySOwPjSjRi3c=;
        fh=nDmcQQeYjb/UA69mkgt4R5k5n8DPKOn5Oj6pJFjlLGM=;
        b=cS6Q+u4ucgqsbrwFLw8d/IQErNy7aHsBWs49W5rFefx1WS/eu07ItakNHUXdl1UORN
         YZJvtwUQ2LMt5WvQMMmhBZlIy9RYOZmq2a5gmfzJNvag4MUN/67WiztVczgpppfkmsXZ
         xa5+fMu8nAcIWFB8fjpHen/l0gTh1jYZNzjWU/S3tBndxcV+q0NSuIWyPjt5a3Pfr6/P
         dZkQVemuL4Vqv+CFlzR3unhhVLNnf4kGxAbUdwiIIic71OvMPUsi8gf+lVFlygYVvsRs
         9KLdszds/GAszCHfJFsVXZv6oypOvSOXUHjADVdHOre1unIvEJEPp8I24bH7+9Tw8z7l
         swmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770430323; x=1771035123; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVXJfBkOf++utzjym33J9FgN5u0L0gqySOwPjSjRi3c=;
        b=a71ZwxUbkdLJzMLgHN2sokJ3PK9DMrrzkKVajPChRd8y4bQLgDN+O+GLfg6v6RzIAN
         o6Vpn2co3uk5sSPHJRkSNtN1ms5F1OV+JtZr1tA3DMN3lGLx2DAe1KH5aRdpMybcCJru
         z2aAoPkkawSFZlR/QQQIg5VOgoSCl1TlVIh/M+dIHJtz6jKOehcwymLTEItG4ipICZFr
         nzAa0wncSoF3g+18arOLlMJePQ+zgKlzzvC1V46WTEiCE9CB6/uyrKKwAyGv/xrr1kJL
         iCVZA6M1QnNDih+u2OWDpV5P/UCWQB5r+L283gnCAAOHQIskm2R7/43Xxss5BoXO5Wcn
         l4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770430323; x=1771035123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xVXJfBkOf++utzjym33J9FgN5u0L0gqySOwPjSjRi3c=;
        b=BUqFSwyIHveph2UIIOhdgk39/l9oVZ8RxRIPiFHxjIpEIQKp7Ndfr4XfTprdJo5wup
         DFumGyjN/F8VCZOS256yYN0VRiWW0r6AloZM2XGipytm/9IGQ5trOOhPYn3glCaBNQnD
         zXJe6cQIkvd/oY6iImjrirLA5XwL4rKV2OhPwtUSgorOZpBbnXOKS6aXFP5y7IjxQzCd
         HaApPoYnoWn1FOO7un3xQlp5odw1z9hxd2H4AdSlc9On5YzcakaMzHSvhkWZjixiv9Qr
         8Oc5R8dczY6/Zp9KHIC5Ic+T91PbPJTv0qmhQ21DgsIARliWeLzfBABzk/en3p0L833E
         8piA==
X-Forwarded-Encrypted: i=1; AJvYcCVRJtEkgrJ2xGgEQOs1mU1Awc+p/lpfUaKCkKjAVmcjnKD4cFfvHIbRQm2jHpiwCs+0MiIT4h0D3dxDMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7DTOZOaVczfcQU7GVJkWjtHiCrbcdsR/ri6EgzO+V3XuVR7je
	B+rcRVzo8IXdYSFLPzUz9FsJsPGREf67UL5PyakMMDC/xcZVbkW0/Cu/+P8o7Eh55q0RIIm8jER
	O4S28U7cgo737Htv6ljDSlPmjql+fW0C1jPyX/2ZmGA==
X-Gm-Gg: AZuq6aK18wkGJ4kQjhGYV+YdT+F6BWBD+xf0iiE0VJbKNiBAXaadH9Er3eFGwYEbEna
	4FcYoLLyY7CAZgev0V3cYS4WCQT3henDYMkPETm/FuJ+WFrbcB+fzSrKqyKe1FCou/X9vgchmJQ
	iwsBb7I/yjl67/i3fVGeX/9ot1D74XHOYxilGU0ml4ntctmL07Gv1bY47fGVowlGfQ1k9gXHO+W
	MLZpfXU7I4ccLb+n/y7/LUQEUeALIQ0dWsyIqUEMr4FBzMve2q3qRUoovr8CBohpUIsCLwv1bRZ
	xLDyGGAN
X-Received: by 2002:a17:906:d54e:b0:b87:2abc:4a2a with SMTP id
 a640c23a62f3a-b8edb7e7fefmr270858966b.1.1770430323440; Fri, 06 Feb 2026
 18:12:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <9C0A2AD4850D179B+524146e74e808db90d5f28fcb6ee791cf1d1bfaa.1770195980.git.lv.zheng@linux.spacemit.com>
 <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs>
 <4D87481E9AABE2C6+72d18f72-9407-4d68-8195-edc6c171df14@linux.spacemit.com>
 <CANXhq0q8N5eHx9ytabZR97Y7AULKwgS2-uEGhcaOOGp9mvbtRQ@mail.gmail.com>
 <6C65A3873186B07C+29da5dbd-ed27-4ace-a5ca-355b3983d60c@linux.spacemit.com>
 <zzbwkazzgeovgmbvg4qnibipzsldqcjnw4axnxlamhgvcld4hs@4m4cc2ctuuvf>
 <752514AD54FA2A1B+513d6894-b3bf-44f3-bcc1-7d30f2642cc2@linux.spacemit.com> <xukccsqgwmagqq5egx7i4op6nfot3t3lusnaso4pfzcq5h6bfz@adsm5nusnocx>
In-Reply-To: <xukccsqgwmagqq5egx7i4op6nfot3t3lusnaso4pfzcq5h6bfz@adsm5nusnocx>
From: Zong Li <zong.li@sifive.com>
Date: Sat, 7 Feb 2026 10:11:53 +0800
X-Gm-Features: AZwV_Qjm6m6hA8715ry8OfD2Mr5pGoAnS-0dMwS1leYT9MosL-HIb3AQrdVJAok
Message-ID: <CANXhq0rFuvfcYRew3ZDWfNOrrAYo01OqPzJ5rbRZN6eS1t72jA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] iommu/riscv: Add HPM support for performance monitoring
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Lv Zheng <lv.zheng@linux.spacemit.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>, iommu@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
	Yaxing Guo <guoyaxing@bosc.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_181206_267822_87C15E67 
X-CRM114-Status: GOOD (  35.18  )
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

T24gRnJpLCBGZWIgNiwgMjAyNiBhdCAxMTowOeKAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIgMDYsIDIwMjYgYXQg
MTE6NDI6MzlBTSArMDgwMCwgTHYgWmhlbmcgd3JvdGU6Cj4gPiBPbiAyLzUvMjAyNiAxMToyMyBQ
TSwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+IC4uLgo+ID4gPiBTaW5jZSBab25nIExpJ3MgcGF0Y2hl
cyB3ZXJlIGFscmVhZHkgb24gdGhlIGxpc3QgdGhlbiB5b3VyIHNlcmllc3dvdWxkPiBhdAo+ID4g
bGVhc3QgZGlzY3VzcyB0aGVtIGluIHRoZSBjb3ZlciBsZXR0ZXIsIGV4cGxhaW5pbmcgd2h5IHlv
dSd2ZSBvcHRlZAo+ID4gPiBub3QgdG8gYWRvcHQgdGhlbS4gQnV0LCBtb3N0IGxpa2VseSBzb21l
IG9mIHRoZSBwYXRjaGVzIGNhbiBiZSBhZG9wdGVkLAo+ID4gPiBzbyB0aG9zZSBzaG91bGQgYmUg
ZXh0cmFjdGVkIGZyb20gWm9uZyBMaSdzIHdvcmsgKHdpdGggYXV0aG9yc2hpcAo+ID4gPiBwcmVz
ZXJ2ZWQpIGFuZCBiYXNlZCB1cG9uIGluIG9yZGVyIHRvIHJlc3BlY3QgdGhhdCBwcmlvciB3b3Jr
Lgo+ID4gPgo+ID4KPiA+IFlvdSBjYW4gc2VlIHdlIGhhdmUgY29udGFjdGVkIGVhY2ggb3RoZXIg
aW4gY29tbXVuaXR5LCBhbmQgZGVjaWRlZCB0bwo+ID4gY29vcGVyYXRlIGluIHRoaXMgd2F5IHRv
IGhvbm9yIGhpcyBjb250cmlidXRpb24uIEJ1dCBmaW5hbCBkZWNpc2lvbiBpcwo+ID4gbGVmdCBm
b3IgdGhlIGNvbW11bml0eSB0byBkZWNpZGU6Cj4gPgo+ID4gRnJvbSBab25nIExpOgo+ID4gPj4g
T2YgY291cnNlLCBpZiB0aGUgY29tbXVuaXR5IHdvdWxkIHByZWZlciB0byBnbyB5b3VyIHZlcnNp
b24sIEnigJltCj4gPiA+PiBwZXJmZWN0bHkgZmluZSB3aXRoIHRoYXQgYXMgd2VsbC4KPiA+Cj4g
PiBXZSByZXNwZWN0IGFsbCBjb250cmlidXRpb25zLCBXZSdsbCBhZGQgdGhlIGxpbmsgaW4gY292
ZXIgbGV0dGVyIHRvIHRoZQo+ID4gZm9sbG93LXVwIHJldmlzaW9ucywgbGV0IG1lIGtub3cgaWYg
YW55dGhpbmcgZWxzZSBzaG91bGQgYmUgZG9uZSB0byB0aGUKPiA+IG5ldyByZXZpc2lvbnMuCj4K
PiBKdXN0IGRvIGFsbCB0aGUgY29tbXVuaWNhdGlvbiBiZWZvcmUgcG9zdGluZywgYWxsb3dpbmcg
dGhhdCBjb21tdW5pY2F0aW9uCj4gdG8gYmUgc3VtbWFyaXplZCBpbiB0aGUgY292ZXIgbGV0dGVy
IGFuZCBpbiBhbnkgYXBwcm9wcmlhdGUgY29tbWl0Cj4gbWVzc2FnZXMgc28gcmV2aWV3ZXJzIGtu
b3cgd2hhdCdzIGdvaW5nIG9uLiBBbHNvIGRvbid0IGZvcmdldCB0byBDQwo+IGFueWJvZHkgcHJl
dmlvdXNseSBpbnZvbHZlZCB0byBlbnN1cmUgdGhleSBoYXZlIGEgY2hhbmNlIHRvIGNoaW1lIGlu
Lgo+Cj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+Cj4gPiBBbmQgbGV0IG1lIGRlc2NyaWJlIGluIGRl
dGFpbHMgdG8gY29tcGFyZSB0aGUgZnVuY3Rpb25hbGl0aWVzIGFuZAo+ID4gYWRkcmVzc2VkIGNv
bW1lbnRzIGJldHdlZW4gd2hhdCBpcyBwcm92aWRlZCBieSBKb2V5IGFuZCBieSBab25nOgo+ID4K
PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDExNTAzMDMwNi4yOTczNS0xLXpv
bmcubGlAc2lmaXZlLmNvbS8KPiA+Cj4gPiBUaGVyZSBpcyBubyBtaXNzaW5nIGZ1bmN0aW9uYWxp
dGllcyBiZXR3ZWVuIHRoZSB0d28gYXBwcm9hY2hlcywgSSBhbHNvCj4gPiBjaGVja2VkIHRoZSBv
cmlnaW5hbCBSb2JpbidzIGNvbW1lbnRzLCBsZXQgbWUgZGVzY3JpYmUgdGhlbSBpbiBkZXRhaWxz
Ogo+Cj4gTXkgY29uY2VybiB3YXNuJ3Qgd2hldGhlciBvciBub3QgUm9iaW4ncyBjb21tZW50cyB3
ZXJlIGFkZHJlc3NlZCBpbiB0aGlzCj4gcG9zdGluZyAodGhhdCdzIGltcG9ydGFudCwgYnV0IG5v
dCB3aGF0IEknbSB0YWxraW5nIGFib3V0KS4gTXkgY29uY2Vybgo+IHdhcyB0aGF0IFpvbmcgTGkn
cyB3b3JrIHdhc24ndCBhZGRyZXNzZWQgaW4gYW55IHdheSwgc28gYXBwZWFyZWQgdG8gYmUKPiBh
IGNoYW5jZSBmb3IgZHVwbGljYXRlZCBlZmZvcnRzLiBJbmRlZWQgaGlzIHJlcGx5IFsxXSBpbmRp
Y2F0ZXMgZXhhY3RseQo+IHRoYXQgYW5kIGV2ZW4gdGhhdCB0aGVyZSBpcyBhIHRoaXJkIHBhdGNo
IHNlcmllcyBiZWluZyB3b3JrZWQKPiBpbmRlcGVuZGVudGx5LiBQbGVhc2Ugd29yayBvdXQgd2hv
IGFuZCB3aGF0IHBhdGNoZXMgYXJlIGdvaW5nIHRvIGJlCj4gdGhlIGZvY3VzIGdvaW5nIGZvcndh
cmQgYW5kIGRlc2NyaWJlIHRoYXQgZGVjaXNpb24gaW4gdGhlIGNvdmVyIGxldHRlcgo+IGZvciB0
aGUgbmV4dCByZXZpc2lvbi4gQW5kIHBsZWFzZSBkb24ndCBmb3JnZXQgdG8gQ0MgWm9uZyBMaSBh
bmQgWWF4aW5nCj4gR3VvLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQU5Y
aHEwb2k5bkU3ZmZMR3N6NWo4R25DMVVEVEQtNGJFNGNhbnRSalcyZlhIWXJqSEFAbWFpbC5nbWFp
bC5jb20vCj4KCkZpcnN0IG9mIGFsbCwgSSBhcG9sb2dpemUgZm9yIHRoZSBkZWxheSBvZiB0aGUg
UE1VIHNlcmllcyBhbmQgYW55CmluY29udmVuaWVuY2UgaXQgbWF5IGhhdmUgY2F1c2VkLiBJIGFs
c28gcmVhbGx5IGFwcHJlY2lhdGUgQW5kcmV3IGZvcgpwb2ludGluZyBvdXQgdGhlIHVwc3RyZWFt
IGN1bHR1cmUgYW5kIGNvbnNlbnN1cy4KCk15IG5leHQgdmVyc2lvbiAodjMgc2VyaWVzKSBpcyBl
eHBlY3RlZCB0byBiZSBzZW50IG91dCBpbiB0aGUgbmV4dApjb3VwbGUgb2YgZGF5cy4gSXQgd2ls
bCBwaWNrIHVwIGFsbCB0aGUgc3VnZ2VzdGlvbnMgYW5kIGZlZWRiYWNrIGZyb20KdGhlIHByZXZp
b3VzIHZlcnNpb25zLiBBcGFydCBmcm9tIHRoYXQsIHRoZSBtYWluIHN0cnVjdHVyYWwgY2hhbmdl
IGlzCnRoYXQgdGhlIFBNVSBkcml2ZXIgaGFzIGJlZW4gbW92ZWQgdW5kZXIgZHJpdmVycy9wZXJm
Lywgd2hpY2ggaXMKc29tZXRoaW5nIHRoYXQgaGFzIGJlZW4gbWVudGlvbmVkIHJlcGVhdGVkbHkg
Ynkgc2V2ZXJhbCBwZW9wbGUuCgpUbyBhbGxvdyBldmVyeW9uZSB0byByZXZpZXcgdGhlIG1ham9y
IGNoYW5nZXMgaW4gdGhlIG5leHQgdmVyc2lvbiBhcwpzb29uIGFzIHBvc3NpYmxlLCB0aGUgY3Vz
dG9tIGV2ZW50IHN1cHBvcnQgd2lsbCBiZSBzcGxpdCBpbnRvIGEKc2VwYXJhdGUgc2VyaWVzLiBJ
dHMgb3ZlcmFsbCBpZGVhIHdpbGwgYmUgc2ltaWxhciB0byBhIHR5cGljYWwKcGxhdGZvcm0gZHJp
dmVyLCB3aGVyZSB2ZW5kb3Itc3BlY2lmaWMgUE1VIGV2ZW50cyBhcmUgZGVmaW5lZCB0aHJvdWdo
CmRyaXZlciBkYXRhLiBNb3JlIGRldGFpbHMgd2lsbCBiZSBkZXNjcmliZWQgaW4gdGhlIHYzIGNv
dmVyIGxldHRlci4KCkFkZGl0aW9uYWxseSwgc2luY2UgSSBkaWQgbm90IGZvbGxvdyB1cCB0aGUg
cGF0Y2hlcyBmcm9tIEx2IFpoZW5nLApKaW5neXUgTGksIG9yIFlheGluZywgaXQgaXMgdmVyeSBw
b3NzaWJsZSB0aGF0IG15IHYzIHNlcmllcyBtYXkgbWlzcwpzb21lIGltcG9ydGFudCBmZWF0dXJl
cyBvciBmaXhlcyBmcm9tIHRoZWlyIHdvcmsuIElmIHRoYXQgaXMgdGhlIGNhc2UsCkkgYXBvbG9n
aXplLCAgSSB3YXMgbm90IGF3YXJlIHRoYXQgdGhvc2UgcGF0Y2hlcyBoYWQgYmVlbiBwb3N0ZWQg
dG8KdGhlIG1haWxpbmcgbGlzdCwgd2hpY2ggaXMgYWxzbyB3aHkgSSBkaWQgbm90IHJlc3BvbmQg
dG8gdGhlaXIgdjEKcGF0Y2ggc2VyaWVzIGluIGEgdGltZWx5IG1hbm5lci4gVGhlcmVmb3JlLCBJ
IHdvdWxkIHJlYWxseSBhcHByZWNpYXRlCml0IGlmIGV2ZXJ5b25lIGNvdWxkIGhlbHAgcmV2aWV3
IHRoZSB2MyBzZXJpZXMgYW5kIHBvaW50IG91dCBhbnkKYWRkaXRpb25hbCBmaXhlcyBvciBmZWF0
dXJlIHN1cHBvcnQgdGhhdCBJIG1heSBoYXZlIG1pc3NlZC4KCkkgYWxzbyByZWFsbHkgYXBwcmVj
aWF0ZSBldmVyeW9uZSBmb3IgYWx3YXlzIGhlbHBpbmcgdG8gYnJpbmcgdXMKdG9nZXRoZXIgYW5k
IGtlZXAgdGhlIGRpc2N1c3Npb25zIGFsaWduZWQuClRoYW5rcwoKPiBUaGFua3MsCj4gZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
