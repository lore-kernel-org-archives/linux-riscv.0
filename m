Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CF9C3ABCB
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 00:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbdhZ6HxRFhjn33XkrB1gwtWzu44VQ8n/PqLNuO9q38=; b=QwuDINzUClyTf21/Yg86KsHDHV
	CtrJd0ew2PLja+u9vWxuGvH2x7B6Op5vjwyO8u1CPG0GwanHGNF7x724sFpM0c/B6x/0YfjBJ0f58
	Pt/NJuaDL/vlcxZj5hxOpmRWrzi4hOEPmjjg0rkE7Lb6J7dxjuxsBGlbUMEe1pmI92TCxyfjr3dvN
	ZSWwNFOGd8HXYOFYpEmseESqeVeJ4paq6N3sDdwxoD97uxXK5w7C6Y5I0HRODvXUhjkwxwO6/fxiM
	xOgn0Sk5BxH1Oh9Tsptp0qCmk3jwSHIsLFlQWBJ9QF3hAgiy0qzqnZwzLZoXF0XvD4bzHUsR0nTl8
	Pf3yAXlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqLeF-000000057Sb-2eW2;
	Tue, 17 Sep 2024 00:00:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqLeB-000000057Rc-0VrV
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 00:00:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fee6435a34so43704075ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 17:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726531246; x=1727136046; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eup1ahvLxbk3GqS/ZMeUjwBFH9cE8D+Ggr+WJlLQMOk=;
        b=00ePe22wFqVfWxiJmOgwt2KLEBb02zR1SsDleMqRVpV3rFzSTh7DBT5smGj3cog01x
         dVRHcFdaE/YnE+yArYgiDsu69FOUfDV3qkVhdLxmIWrdoj0kWtV1GS+ikiovOltMNZh1
         bDuSJpgmjQ2cFhcaJVOGhv0MJlFvkjEi9kZe6GYyir5rYL98TuYqopK022LDVlrskVf6
         v8JATcQOb5l01JlAEgn/wDNlMgNZgHPA2UB0y+pw2TO1vdP4JcFnpFv2EKD+mFieLEVS
         VCmqNMHNk1J3itOXZmR0kfbvR5JW8Sk+RqHPjt4xpYduY5QmlhnyKEX01DrVGRYsUeky
         mrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726531246; x=1727136046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eup1ahvLxbk3GqS/ZMeUjwBFH9cE8D+Ggr+WJlLQMOk=;
        b=UY0mjb6E4NG3dkA3QER/MvSpZHtYumsIhBa4R7AKZEWYnXGbZ2hI9XQigZdS0HZonK
         T209ccMaqCexx0iH5zprURxpRazEQc/mr61g2eNiHlzNb6GaWSZ1JYIIZzmC4DlehElL
         c644N0N1tCKEinl2OB6TMKBEgeInz4RMUcSbq19frrZZf81oShDbDSt4xMcsk9a696xS
         s4EecFo4G1ljbGRq6F0uasEW6cuyhhGmMZ8ZyckZz2eo0p2kZe/rGmIiDJanAuy2G9U+
         fmv47cF40ZywnGaHvwgmyGeHX89T/4UG2fLqkx0T+rM3JeD2mSlr1cdE4eFaANala1Dq
         kmdg==
X-Forwarded-Encrypted: i=1; AJvYcCXXSOnXVTqjNLp700TGEW9bzleYTij4IxszCs96vS7uFLM/liwavbPzrD4WBpYje1Km9WDyYJYw+/5miA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGqvo3bTbuI8peHvTfR7yWuM3xfKXTCaD0tVMqhUstXQyKFX28
	aIAsr9zvGkSHJLWKAvQpXsn3Ncj9qFAypfQZzEPHEWroXZ9OzXoJTi4Ga+6+SOw/F8EAs8sfvVk
	0
X-Google-Smtp-Source: AGHT+IH64YpGkOt6sdEnN70vzwbW5vOexKApQ3tQQA6MC8BwStmIPrrAyTwaRSTJo5R11SP51oTbHQ==
X-Received: by 2002:a17:902:ea0d:b0:205:7c76:4b2c with SMTP id d9443c01a7336-2076e412882mr247960785ad.48.1726531245442;
        Mon, 16 Sep 2024 17:00:45 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794601384sm41311685ad.94.2024.09.16.17.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 17:00:45 -0700 (PDT)
Date: Mon, 16 Sep 2024 17:00:40 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
	quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net,
	david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com,
	broonie@kernel.org, dave.hansen@linux.intel.com,
	atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com,
	usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org,
	jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org,
	shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com,
	robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com,
	lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn,
	anup@brainfault.org, deller@gmx.de, x86@kernel.org,
	andrii@kernel.org, willy@infradead.org, kees@kernel.org,
	mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com,
	greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com,
	revest@chromium.org, ancientmodern4@gmail.com,
	aou@eecs.berkeley.edu, jerry.shih@sifive.com,
	alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com,
	charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com,
	leobras@redhat.com, songshuaishuai@tinylab.org,
	xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com,
	mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de,
	krzk+dt@kernel.org, vbabka@suse.cz, brauner@kernel.org,
	bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com,
	samuel.holland@sifive.com, ben.dooks@codethink.co.uk,
	evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com,
	andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org,
	sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v4 21/30] riscv/traps: Introduce software check exception
Message-ID: <ZujGqOVbYZ8+8XPu@debug.ba.rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
 <20240912231650.3740732-22-debug@rivosinc.com>
 <CAFTtA3NA+OwZv5hJU3EWjuNHNjA3fQzPC+sX84Nb9YyJXdENSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFTtA3NA+OwZv5hJU3EWjuNHNjA3fQzPC+sX84Nb9YyJXdENSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_170047_467347_3847B3E5 
X-CRM114-Status: GOOD (  22.33  )
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

T24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgMDk6MzU6NTBQTSArMDIwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+SGkgRGVlcGFrCj4KPkRlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPiDmlrwgMjAy
NOW5tDnmnIgxM+aXpSDpgLHkupQg5LiK5Y2IMjozMuWvq+mBk++8mgo+Pgo+PiB6aWNmaXNzIC8g
emljZmlscCBpbnRyb2R1Y2VzIGEgbmV3IGV4Y2VwdGlvbiB0byBwcml2IGlzYSBgc29mdHdhcmUg
Y2hlY2sKPj4gZXhjZXB0aW9uYCB3aXRoIGNhdXNlIGNvZGUgPSAxOC4gVGhpcyBwYXRjaCBpbXBs
ZW1lbnRzIHNvZnR3YXJlIGNoZWNrCj4+IGV4Y2VwdGlvbi4KPj4KPj4gQWRkaXRpb25hbGx5IGl0
IGltcGxlbWVudHMgYSBjZmkgdmlvbGF0aW9uIGhhbmRsZXIgd2hpY2ggY2hlY2tzIGZvciBjb2Rl
Cj4+IGluIHh0dmFsLiBJZiB4dHZhbD0yLCBpdCBtZWFucyB0aGF0IHN3IGNoZWNrIGV4Y2VwdGlv
biBoYXBwZW5lZCBiZWNhdXNlIG9mCj4+IGFuIGluZGlyZWN0IGJyYW5jaCBub3QgbGFuZGluZyBv
biA0IGJ5dGUgYWxpZ25lZCBQQyBvciBub3QgbGFuZGluZyBvbgo+PiBgbHBhZGAgaW5zdHJ1Y3Rp
b24gb3IgbGFiZWwgdmFsdWUgZW1iZWRkZWQgaW4gYGxwYWRgIG5vdCBtYXRjaGluZyBsYWJlbAo+
PiB2YWx1ZSBzZXR1cCBpbiBgeDdgLiBJZiB4dHZhbD0zLCBpdCBtZWFucyB0aGF0IHN3IGNoZWNr
IGV4Y2VwdGlvbiBoYXBwZW5lZAo+PiBiZWNhdXNlIG9mIG1pc21hdGNoIGJldHdlZW4gbGluayBy
ZWdpc3RlciAoeDEgb3IgeDUpIGFuZCB0b3Agb2Ygc2hhZG93Cj4+IHN0YWNrIChvbiBleGVjdXRp
b24gb2YgYHNzcG9wY2hrYCkuCj4+Cj4+IEluIGNhc2Ugb2YgY2ZpIHZpb2xhdGlvbiwgU0lHU0VH
ViBpcyByYWlzZWQgd2l0aCBjb2RlPVNFR1ZfQ1BFUlIuCj4+IFNFR1ZfQ1BFUlIgd2FzIGludHJv
ZHVjZWQgYnkgeDg2IHNoYWRvdyBzdGFjayBwYXRjaGVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBE
ZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmggfCAgMSArCj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2VudHJ5LWNvbW1vbi5oICAgfCAgMiArKwo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvZW50cnku
UyAgICAgICAgICAgICAgIHwgIDMgKysKPj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAg
ICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDQgZmlsZXMgY2hh
bmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9hc20tcHJvdG90eXBlcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJv
dG90eXBlcy5oCj4+IGluZGV4IGNkNjI3ZWMyODlmMS4uNWEyN2NlZmQ3ODA1IDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmgKPj4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oCj4+IEBAIC01MSw2ICs1MSw3IEBA
IERFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX3UpOwo+PiAgREVDTEFSRV9ET19F
UlJPUl9JTkZPKGRvX3RyYXBfZWNhbGxfcyk7Cj4+ICBERUNMQVJFX0RPX0VSUk9SX0lORk8oZG9f
dHJhcF9lY2FsbF9tKTsKPj4gIERFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2JyZWFrKTsK
Pj4gK0RFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX3NvZnR3YXJlX2NoZWNrKTsKPj4KPj4g
IGFzbWxpbmthZ2Ugdm9pZCBoYW5kbGVfYmFkX3N0YWNrKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsK
Pj4gIGFzbWxpbmthZ2Ugdm9pZCBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKTsK
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9uLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oCj4+IGluZGV4IDIyOTNlNTM1Zjg2
NS4uNDA2OGM3ZTU0NTJhIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Vu
dHJ5LWNvbW1vbi5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9u
LmgKPj4gQEAgLTM5LDQgKzM5LDYgQEAgc3RhdGljIGlubGluZSBpbnQgaGFuZGxlX21pc2FsaWdu
ZWRfc3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICB9Cj4+ICAjZW5kaWYKPj4KPj4gK2Jv
b2wgaGFuZGxlX3VzZXJfY2ZpX3Zpb2xhdGlvbihzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4+ICsK
Pj4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX0VOVFJZX0NPTU1PTl9IICovCj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+
PiBpbmRleCBjYTkyMDNlNmQ3NmQuLjJlYzc1YmE4NjRhOCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvZW50cnkuUwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4+
IEBAIC0zODQsNiArMzg0LDkgQEAgU1lNX0RBVEFfU1RBUlRfTE9DQUwoZXhjcF92ZWN0X3RhYmxl
KQo+PiAgICAgICAgIFJJU0NWX1BUUiBkb19wYWdlX2ZhdWx0ICAgLyogbG9hZCBwYWdlIGZhdWx0
ICovCj4+ICAgICAgICAgUklTQ1ZfUFRSIGRvX3RyYXBfdW5rbm93bgo+PiAgICAgICAgIFJJU0NW
X1BUUiBkb19wYWdlX2ZhdWx0ICAgLyogc3RvcmUgcGFnZSBmYXVsdCAqLwo+PiArICAgICAgIFJJ
U0NWX1BUUiBkb190cmFwX3Vua25vd24gLyogY2F1c2U9MTYgKi8KPj4gKyAgICAgICBSSVNDVl9Q
VFIgZG9fdHJhcF91bmtub3duIC8qIGNhdXNlPTE3ICovCj4+ICsgICAgICAgUklTQ1ZfUFRSIGRv
X3RyYXBfc29mdHdhcmVfY2hlY2sgLyogY2F1c2U9MTggaXMgc3cgY2hlY2sgZXhjZXB0aW9uICov
Cj4+ICBTWU1fREFUQV9FTkRfTEFCRUwoZXhjcF92ZWN0X3RhYmxlLCBTWU1fTF9MT0NBTCwgZXhj
cF92ZWN0X3RhYmxlX2VuZCkKPj4KPj4gICNpZm5kZWYgQ09ORklHX01NVQo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
Pj4gaW5kZXggNTFlYmZkMjNlMDA3Li4zMmQxNDUzYmVkNzIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+
PiBAQCAtMzU0LDYgKzM1NCw0NCBAQCB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVn
cyAqcmVncykKPj4KPj4gIH0KPj4KPj4gKyNkZWZpbmUgQ0ZJX1RWQUxfRkNGSV9DT0RFICAgICAy
Cj4+ICsjZGVmaW5lIENGSV9UVkFMX0JDRklfQ09ERSAgICAgMwo+PiArLyogaGFuZGxlIGNmaSB2
aW9sYXRpb25zICovCj4+ICtib29sIGhhbmRsZV91c2VyX2NmaV92aW9sYXRpb24oc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCj4+ICt7Cj4+ICsgICAgICAgYm9vbCByZXQgPSBmYWxzZTsKPj4gKyAgICAg
ICB1bnNpZ25lZCBsb25nIHR2YWwgPSBjc3JfcmVhZChDU1JfVFZBTCk7Cj4+ICsKPj4gKyAgICAg
ICBpZiAoKCh0dmFsID09IENGSV9UVkFMX0ZDRklfQ09ERSkgJiYgY3B1X3N1cHBvcnRzX2luZGly
ZWN0X2JyX2xwX2luc3RyKCkpIHx8Cj4+ICsgICAgICAgICAgICAgICAoKHR2YWwgPT0gQ0ZJX1RW
QUxfQkNGSV9DT0RFKSAmJiBjcHVfc3VwcG9ydHNfc2hhZG93X3N0YWNrKCkpKSB7Cj4+ICsgICAg
ICAgICAgICAgICBkb190cmFwX2Vycm9yKHJlZ3MsIFNJR1NFR1YsIFNFR1ZfQ1BFUlIsIHJlZ3Mt
PmVwYywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIk9vcHMg
LSBjb250cm9sIGZsb3cgdmlvbGF0aW9uIik7Cj4+ICsgICAgICAgICAgICAgICByZXQgPSB0cnVl
Owo+PiArICAgICAgIH0KPj4gKwo+PiArICAgICAgIHJldHVybiByZXQ7Cj4+ICt9Cj4+ICsvKgo+
PiArICogc29mdHdhcmUgY2hlY2sgZXhjZXB0aW9uIGlzIGRlZmluZWQgd2l0aCByaXNjLXYgY2Zp
IHNwZWMuIFNvZnR3YXJlIGNoZWNrCj4+ICsgKiBleGNlcHRpb24gaXMgcmFpc2VkIHdoZW46LQo+
PiArICogYSkgQW4gaW5kaXJlY3QgYnJhbmNoIGRvZXNuJ3QgbGFuZCBvbiA0IGJ5dGUgYWxpZ25l
ZCBQQyBvciBgbHBhZGAKPj4gKyAqICAgIGluc3RydWN0aW9uIG9yIGBsYWJlbGAgdmFsdWUgcHJv
Z3JhbW1lZCBpbiBgbHBhZGAgaW5zdHIgZG9lc24ndAo+PiArICogICAgbWF0Y2ggd2l0aCB2YWx1
ZSBzZXR1cCBpbiBgeDdgLiByZXBvcnRlZCBjb2RlIGluIGB4dHZhbGAgaXMgMi4KPj4gKyAqIGIp
IGBzc3BvcGNoa2AgaW5zdHJ1Y3Rpb24gZmluZHMgYSBtaXNtYXRjaCBiZXR3ZWVuIHRvcCBvZiBz
aGFkb3cgc3RhY2sgKHNzcCkKPj4gKyAqICAgIGFuZCB4MS94NS4gcmVwb3J0ZWQgY29kZSBpbiBg
eHR2YWxgIGlzIDMuCj4+ICsgKi8KPgo+SXQgc2VlbXMgbGlrZSB0aGlzIHRyYXAgaGFuZGxlciBk
b2VzIG5vdCBmb2xsb3cgZ2VuZXJpYyBlbnRyeS4gVGhpcwo+Y2FuIGNhdXNlIHByb2JsZW1zIGFz
IHNpZ25hbCBkZWxpdmVyeSBpcyBkb25lIGluCj5pcnFlbnRyeV9leGl0X3RvX3VzZXJfbW9kZSgp
LiBQbGVhc2UgcmVmZXJlbmNlIHRoZSBjb21taXQgZjBiZGRmNTA1ODZkCj4oInJpc2N2OiBlbnRy
eTogQ29udmVydCB0byBnZW5lcmljIGVudHJ5IikgZm9yIG1vcmUgaW5mb3JtYXRpb24uCgpBY2su
IHdpbGwgZml4IGl0LgoKPgo+PiArYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24g
dm9pZCBkb190cmFwX3NvZnR3YXJlX2NoZWNrKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiArewo+
PiArICAgICAgIGlmICh1c2VyX21vZGUocmVncykpIHsKPj4gKyAgICAgICAgICAgICAgIC8qIG5v
dCBhIGNmaSB2aW9sYXRpb24sIHRoZW4gbWVyZ2UgaW50byBmbG93IG9mIHVua25vd24gdHJhcCBo
YW5kbGVyICovCj4+ICsgICAgICAgICAgICAgICBpZiAoIWhhbmRsZV91c2VyX2NmaV92aW9sYXRp
b24ocmVncykpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRvX3RyYXBfdW5rbm93bihyZWdz
KTsKPj4gKyAgICAgICB9IGVsc2Ugewo+PiArICAgICAgICAgICAgICAgLyogc3cgY2hlY2sgZXhj
ZXB0aW9uIGNvbWluZyBmcm9tIGtlcm5lbCBpcyBhIGJ1ZyBpbiBrZXJuZWwgKi8KPj4gKyAgICAg
ICAgICAgICAgIGRpZShyZWdzLCAiS2VybmVsIEJVRyIpOwo+PiArICAgICAgIH0KPj4gK30KPj4g
Kwo+PiAgI2lmZGVmIENPTkZJR19NTVUKPj4gIGFzbWxpbmthZ2UgX192aXNpYmxlIG5vaW5zdHIg
dm9pZCBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiAgewo+PiAtLQo+PiAy
LjQ1LjAKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo+Cj5DaGVlcnMsCj5BbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
