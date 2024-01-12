Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE54C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Q+u0i8HiaEavmaxr9UJfmH35jHO3ZSUf+mo+88HxoU4=; b=VTRereQmzlPetuz1QPkgzH+G1T
	6fq3EGAO926w5sVRJkWtN6TBlrCYvlxRZ/XC1VjWp9nE0GLPv3h9na7m2hVByk1AF/MNTe9i8LfO/
	SyrHAHBtBsTVcl7ZR3dLZ+LAf6pSol1IaPYvfmb5mvtsrWmMLBiVoqv5JkCTJuW1RIRALOcAw5gnZ
	emqkacP1LFANoXqLqxsA0PaTFzy1g8iKRgp5Sp/kJ+lYNc9FF76k86qVqa5E1C708sEWbVGZzhpGB
	S9aKsygJz6XmohrV2WXJOz+iy7K962l9/bulBggCGLTHbNeHQ7yT0kIM2j4WXjRF0ccOcVHP/jnR3
	GVXNVNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMNq-003cpk-0v;
	Fri, 12 Jan 2024 18:35:58 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMNn-003cns-1O
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 18:35:57 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-598a3a5bd36so1447019eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 10:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1705084554; x=1705689354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9TmCyjzctL8Dxrhx3ETtJUZ7jIm372WOmPQF31r6QY=;
        b=mXvhrB2IQKH6f0lDeV9+YVZ/zs6OVeN8ng2AJDemmM35HRINDZ3EMxL+AjV//Yu9hs
         JnyNZNmLb7AcV5ZKP5/MWdBiZg5bRcACprC8zE8px9qFVt+2A5yWisE8YIpzWAxopH2b
         6pCBwSVYVztF2OEVBvyIIyv8lRrxfUYjDHxnLav2MwWn+7avLx0Cp9zWWjU1k6reKUxb
         O2fNmS0nFkKU8mzA8TumHjyN/5AXvBEf2dt1JHSchpRoUrNY5NzxUGjDrtEtOh+zZgz9
         ikDCRhfn2+J50MHskQGQ0wUX/y4rXuqScbSelSbReXS3i49QanAGfEsTvqyzqt0QHbbZ
         1PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705084554; x=1705689354;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9TmCyjzctL8Dxrhx3ETtJUZ7jIm372WOmPQF31r6QY=;
        b=mHFz3acgSFi68Gs81PGfsYv7R95n/eaTBabAAJKNcZLfJtsXpm/JPOqiahYLCZVykU
         l88lYhqq3duTIEahT/YXhvri9Jc+aWhvq1lINQN09X79I+HemdQcBi8vSzrZm5kej8r1
         EcghygR7n1MzKhCveiQZi5L5WA+gQ+B+AjWcKulb7vauPXrRp9sQfG/8+gNZCqF04LXf
         rGVkvu74I/hR4/RS9GJJzfUg3t2LckKBu6WeXw95hxJPI4P7IN0/grpIwtVuoBV88XCj
         h70f7RjZ8+oGgQkfLngOjU1JCRH3u7GKyrANNcg/nX/IAe2DwM+Gfxy1NATsi+nONzaZ
         3O2A==
X-Gm-Message-State: AOJu0Yw+wM98+uRGKRJLq0/PvoZDqhhzqjUNj2CRDdkIcZE8B/4meZju
	buP4QloKTcEzrVU2Aq+E03icTwnQINDQdB7fLcfWmjtxi38=
X-Google-Smtp-Source: AGHT+IELVw8MAlFGSwwsQ8ww6KLqzHuG10HWwee8GRCjNBuYa3/6BGeT9PbLCt/UTRcduPyPzAQn7g==
X-Received: by 2002:a4a:9d14:0:b0:598:7aec:474e with SMTP id w20-20020a4a9d14000000b005987aec474emr994382ooj.19.1705084553918;
        Fri, 12 Jan 2024 10:35:53 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id v37-20020a4a8c68000000b005946233fa4esm794635ooj.34.2024.01.12.10.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 10:35:53 -0800 (PST)
Date: Fri, 12 Jan 2024 10:35:53 -0800 (PST)
X-Google-Original-Date: Fri, 12 Jan 2024 10:35:51 PST (-0800)
Subject: Re: [v10, 00/10] riscv: support kernel-mode Vector
In-Reply-To: <CABgGipXYeE4J3226yoAU9J25eeP+vWofqL1mMYoD9axthJrk2Q@mail.gmail.com>
CC: bjorn@kernel.org, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com, charlie@rivosinc.com,
  Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org, tglx@linutronix.de,
  ebiggers@kernel.org, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-275a5587-68ad-4ad6-9fd9-e973e78d9b22@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_103555_472401_2769F995 
X-CRM114-Status: GOOD (  28.42  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMiBKYW4gMjAyNCAwODowMzoyNCBQU1QgKC0wODAwKSwgYW5keS5jaGl1QHNpZml2
ZS5jb20gd3JvdGU6Cj4gT24gRnJpLCBKYW4gMTIsIDIwMjQgYXQgMTE6MjnigK9QTSBCasO2cm4g
VMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gQW5keSwKPj4KPj4gPiBIZWxs
bzoKPj4gPgo+PiA+IFRoaXMgc2VyaWVzIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAo
Zm9yLW5leHQpCj4+ID4gYnkgUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Ogo+
PiA+Cj4+Cj4+IEknbSBnZXR0aW5nIHNvbWUgYm9vdCBpc3N1ZXMgd2l0aCB0aGlzIHNlcmllcyBh
cHBsaWVkIHRvIHJpc2N2L2Zvci1uZXh0Lgo+Pgo+PiBUaGUgZnVsbCBydW5zICh3aXRoIGxvZ3Mp
IGlzIGhlcmU6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9saW51eC1yaXNjdi9h
Y3Rpb25zL3J1bnMvNzQ5ODcwNjMyNgo+Pgo+PiBUeXBpY2FsbHkgaXQgZmFpbHMgaW4gdHdvIHdh
eXM6Cj4+IFVidW50dSByb290ZnM6Cj4+IC0tODwtLQo+PiBbIDQuMzQ2NDE0XSAoc2QtZ2Vucylb
NjhdOiBGYWlsZWQgdG8gZXh0cmFjdCBmaWxlIG5hbWUgZnJvbSAnJzogSW52YWxpZCBhcmd1bWVu
dAo+PiBbIDQuMzkwODMyXSBzeXN0ZW1kWzFdOiBGYWlsZWQgdG8gZm9yayBvZmYgc2FuZGJveGlu
ZyBlbnZpcm9ubWVudCBmb3IgZXhlY3V0aW5nIGdlbmVyYXRvcnM6IFByb3RvY29sIGVycm9yCj4+
IFtFU0NbMDsxOzMxbSEhISEhIUVTQ1swbV0gRmFpbGVkIHRvIHN0YXJ0IHVwIG1hbmFnZXIuCj4+
IFsgNC40NDAxNjRdIHN5c3RlbWRbMV06IEZyZWV6aW5nIGV4ZWN1dGlvbi4KPj4gLS04PC0tCj4+
Cj4+IG9yOgo+PiAtLTg8LS0KPj4gWyAgIDE0LjkwOTkxMl0gKHNkLWdlbnMpWzcxXTogQXNzZXJ0
aW9uICchc3Rydl9pc2VtcHR5KGRpcnMpJyBmYWlsZWQgYXQgc3JjL3NoYXJlZC9leGVjLXV0aWwu
YzoyMTEsIGZ1bmN0aW9uIGV4ZWN1dGVfZGlyZWN0b3JpZXMoKS4gQWJvcnRpbmcuCj4+IFsgICAx
NS4wMDg0ODBdIHN5c3RlbWRbMV06IEZhaWxlZCB0byBmb3JrIG9mZiBzYW5kYm94aW5nIGVudmly
b25tZW50IGZvciBleGVjdXRpbmcgZ2VuZXJhdG9yczogUHJvdG9jb2wgZXJyb3IKPj4gW0VTQ1sw
OzE7MzFtISEhISEhRVNDWzBtXSBGYWlsZWQgdG8gc3RhcnQgdXAgbWFuYWdlci4KPj4gWyAgIDE1
LjExMTk4OV0gc3lzdGVtZFsxXTogRnJlZXppbmcgZXhlY3V0aW9uLgo+PiAtLTg8LS0KPj4KPj4g
YW5kIEFscGluZSB3aXRoOgo+PiAtLTg8LS0KPj4gWyAwLjAzNjcwM10gS2VybmVsIHBhbmljIC0g
bm90IHN5bmNpbmc6IGttZW1fY2FjaGVfY3JlYXRlX3VzZXJjb3B5OiBGYWlsZWQgdG8gY3JlYXRl
IHNsYWIgJ3Jpc2N2X3ZlY3Rvcl9jdHgnLiBFcnJvciAtMjIKPj4gWyAwLjAzOTE5NV0gQ1BVOiAw
IFBJRDogMCBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNi43LjAtcmMxLWRlZmNvbmZpZ19w
bGFpbi1nZGY5NDQ3MDQxODJlICMxCj4+IFsgMC4wNDA3NDRdIEhhcmR3YXJlIG5hbWU6IHJpc2N2
LXZpcnRpbyxxZW11IChEVCkKPj4gWyAwLjA0MTk3NV0gQ2FsbCBUcmFjZToKPj4gWyAwLjA0Mjgx
M10gWzxmZmZmZmZmZjgwMDA2N2E0Pl0gZHVtcF9iYWNrdHJhY2UrMHgxYy8weDI0Cj4+IFsgMC4w
NDQ4MzJdIFs8ZmZmZmZmZmY4MDk0NTk4MD5dIHNob3dfc3RhY2srMHgyYy8weDM4Cj4+IFsgMC4w
NDU3MjRdIFs8ZmZmZmZmZmY4MDk1MjIxND5dIGR1bXBfc3RhY2tfbHZsKzB4M2MvMHg1NAo+PiBb
IDAuMDQ2ODQxXSBbPGZmZmZmZmZmODA5NTIyNDA+XSBkdW1wX3N0YWNrKzB4MTQvMHgxYwo+PiBb
IDAuMDQ3NDI4XSBbPGZmZmZmZmZmODA5NDVlN2M+XSBwYW5pYysweDEwNi8weDI5ZQo+PiBbIDAu
MDQ3OTk4XSBbPGZmZmZmZmZmODAxNWYxNGM+XSBrbWVtX2NhY2hlX2NyZWF0ZV91c2VyY29weSsw
eDIwZS8weDI1OAo+PiBbIDAuMDQ4Nzg2XSBbPGZmZmZmZmZmODBhMDQ0ZGM+XSByaXNjdl92X3Nl
dHVwX2N0eF9jYWNoZSsweDJjLzB4M2MKPj4gWyAwLjA0OTUyMV0gWzxmZmZmZmZmZjgwYTAzYTQ4
Pl0gYXJjaF90YXNrX2NhY2hlX2luaXQrMHgxMC8weDE4Cj4+IFsgMC4wNTc4MzJdIFs8ZmZmZmZm
ZmY4MGEwNzA2Yz5dIGZvcmtfaW5pdCsweDQyLzB4MTY4Cj4+IFsgMC4wNTg3MzddIFs8ZmZmZmZm
ZmY4MGEwMGQ3MD5dIHN0YXJ0X2tlcm5lbCsweDZiYS8weDczYQo+PiAtLTg8LS0KPj4KPj4gVGhl
IEFscGluZSBib290IGNhbiBiZSBmaXhlZCB3aXRoIHNvbWV0aGluZyBsaWtlOgo+PiAtLTg8LS0K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdmVjdG9yLmMKPj4gaW5kZXggZjk3Njk3MDNmZDM5Li4wYWM3OWE5Y2RiYTUgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3ZlY3Rvci5jCj4+IEBAIC01Myw2ICs1Myw5IEBAIGludCByaXNjdl92X3NldHVwX3Zz
aXplKHZvaWQpCj4+Cj4+ICB2b2lkIF9faW5pdCByaXNjdl92X3NldHVwX2N0eF9jYWNoZSh2b2lk
KQo+PiAgewo+PiArICAgICAgIGlmICghcmlzY3Zfdl92c2l6ZSkKPj4gKyAgICAgICAgICAgICAg
IHJldHVybjsKPj4gKwo+PiAgICAgICAgIHJpc2N2X3ZfdXNlcl9jYWNoZXAgPSBrbWVtX2NhY2hl
X2NyZWF0ZV91c2VyY29weSgicmlzY3ZfdmVjdG9yX2N0eCIsCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2X3ZfdnNpemUsIDE2
LCBTTEFCX1BBTklDLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAwLCByaXNjdl92X3ZzaXplLCBOVUxMKTsKPj4gLS04PC0tCj4KPiBT
b3JyeSBmb3IgdGhhdCEgSSBmb3Jnb3QgdG8gZG8gYSBoYXNfdmVjdG9yKCkgY2hlY2sgYmVmb3Jl
IGNyZWF0aW5nCj4gdGhlIGNhY2hlLiBJIGFtIGdvaW5nIHRvIHNlbmQgYSBwYXRjaCB0byBmaXgg
aXQuCgpUaGV5IGRvbid0IGZhaWwgZm9yIG1lIGVpdGhlciwgd2hpY2ggaXMgaG93IHRoZXkgZW5k
ZWQgdXAgb24gZm9yLW5leHQuICAKU28gc29ycnkgSSBtaXNzZWQgaXQuCgpEbyB5b3UgaGF2ZSBh
IGZpeD8gIE90aGVyd2lzZSBJIGNhbiBqdXN0IGRyb3AgdGhlc2UgZnJvbSBmb3ItbmV4dCBhbmQg
d2UgCmNhbiBkbyBhIHYxMSAtLSBpdCdzIHRoZSB0aXAgb2YgZm9yLW5leHQsIHNvIHN0aWxsIHBy
ZXR0eSBlYXN5IHRhIGJhY2sgCm91dC4KCj4KPj4KPj4gYnV0IHdpdGggdGhpcyAiZml4IiBpbiBw
bGFjZSBJIHN0aWxsIGdldCBVYnVudHUgYm9vdCBmYWlsdXJlcy4gVG8KPj4gcmVwcm9kdWNlIHRo
ZSBDSSBsb2NhbGx5Ogo+Pgo+PiAgIHwgZ2l0IGZldGNoIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51
eC1yaXNjdi9saW51eC1yaXNjdiBlMmFhZDc1YjM0MGQ2NWIwYmU0ZDFhNjg5ZGIzZTEwYzZlZDNm
MThlCj4+ICAgfCBnaXQgY2hlY2tvdXQgRkVUQ0hfSEVBRAo+PiAgIHwgZG9ja2VyIHB1bGwgZ2hj
ci5pby9saW51eC1yaXNjdi9wdy1idWlsZGVyLW11bHRpOmxhdGVzdAo+PiAgIHwgZG9ja2VyIHJ1
biAtaXQgLS12b2x1bWUgJFBXRDovYnVpbGQvbXktbGludXggZ2hjci5pby9saW51eC1yaXNjdi9w
dy1idWlsZGVyLW11bHRpOmxhdGVzdCBiYXNoCj4+ICAgfCAjIEluIGNvbnRhaW5lcgo+PiAgIHwg
YmFzaCAtbAo+PiAgIHwgbWtkaXIgLXAgL2J1aWxkL2tlcm5lbHMvbG9ncwo+PiAgIHwgLmdpdGh1
Yi9zY3JpcHRzL3Nlcmllcy9wcmVwYXJlX3Rlc3RzLnNoCj4+ICAgfCBjZCAvYnVpbGQvbXktbGlu
dXgKPj4gICB8IC5naXRodWIvc2NyaXB0cy9zZXJpZXMva2VybmVsX2J1aWxkZXIuc2ggcnY2NCBk
ZWZjb25maWcgcGxhaW4gZ2NjCj4+ICAgfCAuZ2l0aHViL3NjcmlwdHMvc2VyaWVzL3Rlc3RfcnVu
bmVyLnNoIHJ2NjQgZGVmY29uZmlnIHBsYWluIGdjYyB1YnVudHUKPj4gICB8IC5naXRodWIvc2Ny
aXB0cy9zZXJpZXMvdGVzdF9ydW5uZXIuc2ggcnY2NCBkZWZjb25maWcgcGxhaW4gZ2NjIGFscGlu
ZQo+Cj4gSXQncyB3ZWlyZCB0aGF0IHRoZXNlIGVycm9ycyBkbyBub3Qgc2hvdyB1cCBpbiBteSB0
ZXN0IGVudmlyb25tZW50LiBJCj4gd2lsbCB0cnkgdG8gcmVwcm9kdWNlIGl0IHdpdGggdGhlIHNj
cmlwdCBhYm92ZS4KPgo+Pgo+PiBMb2dzIGluIC9idWlsZC90ZXN0cy9ydW5fdGVzdCoKPj4KPj4g
SSdsbCBjb250aW51ZSB0byBkZWJ1ZyBpbiB0aGUgbWVhbnRpbWUuCj4+Cj4+Cj4+IEJqw7Zybgo+
Cj4gVGhhbmtzLAo+IEFuZHkKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
