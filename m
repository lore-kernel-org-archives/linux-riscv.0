Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A857C55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJ4M/rjSZtutIAMDrMWdpbM9P4d1CjRqLaRCvMoP9Jg=; b=bBeKG4u+fDbIVC
	NYIyxgLVWERHkHGRDegxgn2muruh+WcE01FPhClGjVQ6UcQwtfYNpuJjT/oI7DL0xjzN6cr14S5jx
	+6UdGlAkGvGgWMfvaJI2Qf0ZBWGw428YRUerF4fiXR7xyHpovTQfLOiN6bS1g2YlVVQvWQEmp31sR
	ZaQNuA9fXh1Ia5cIfj1u8RHWw+MogLV13Sp+N7xHBPZZJB9YEvBYgY8/5tjrMMWVXEm4IzQsn4l2J
	rW4dTzr0ZWfIQe3wj3xlxSlY8l8CYQKvvnevUUr8NYbIrCwEozn6oFlKzONsvRdT3AnsoT72kVes/
	GY781F0PNv1KYatORKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshG7-00000009QBZ-1kEY;
	Sat, 08 Aug 2026 13:38:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshG3-00000009QAt-493b
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 13:38:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47fde295992so314400f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Aug 2026 06:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786196318; cv=none;
        d=google.com; s=arc-20260327;
        b=ZRgZAhCXhtYa4Eu3pGsh9RTa8oeiegicBZGR8qux+oc9C5wq920aqJvB4i8ktJKi8L
         a+IyYF1cerLEkG0pvS8uHLDqf6UzegyoLgSXSjB8LCWs7K1lrmYIVYgo1LTopOizCKkg
         s4atHGrjMsnLCpQOcBjmH4HB2xyQ0bfXNS2iQECwQmC7M8El/EOGfIj/daCB746VOELG
         QwW7m97wvsWyLok6blv9dEGcoX7BDUppg93JbUXqLBzjpOaHe41YSgz/jLU2B8A/mIce
         LVtfM74fnkuAUtH9KbnIVoNmKd9/o4D5fE2dRxegXX9iAWVqKuDPlpDvRXY8da4KzsJX
         28pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LfZyWZCjJ1leqVfT0SG7I+7umcPy1TcL4EPeJOs9ZU8=;
        fh=HKPkVv7I8hKhklJ0UoRVYlthXZJFEUvVnSlak1yw86A=;
        b=M9Zuiw03C4cptp6rDBr4tWDdsFn8/YLo8Y6W5yDNWdVyqsLAA7iEcCNUYh4jXcGEwT
         UUqanZtky6Dr7cRsiiYbE76uuuP2B+qeXSVCO7CSvhyj6Bkldpwv8KY9xyDkT3T8Il30
         FSOtUNoqKTHWYA00uUymXTbTOzHHHE/tw6LlGtbMlUpsrDuxCbqoh8aZNxXFLpM5XYrS
         S/Y9NT202LF2tkO4D/W8UERkQWBBDco+J4sIhi2UpMJ+w29S/n6aWJkZ6bX3SgcCdHll
         RUvYjFHmx8uSRdSZnU6ty83XTJwLELKG9+jdoVurJ/LpYYYSDiQBE6dzGok4BO+Gm4oV
         v63g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786196318; x=1786801118; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LfZyWZCjJ1leqVfT0SG7I+7umcPy1TcL4EPeJOs9ZU8=;
        b=kfE2n6Xc/jkhz3e2V6M2MBVFyraqojO+eI0QsvO9jbPYOnF7yhkF6tQlFhsPPU5wAh
         Gi01ath/HGpLFr0J7MeyeuktIkbMlVNZSMhveU7N3XR57jUF8ETghDXwHuqXr9vN4FoD
         IwltY/eoaX0d3h/amFXRp4Bf8k6OOJBEmjh7I90zoIRHkvejjKk4blEztf9dcNZX46TM
         XxO4UrhpgKx3ZuDw8s3C2z+zraZx8TWu6c3TnzuPY4acJSpkA/eekLauqNi/jVVKxBU2
         55pbof8JFb+QdkUA6GNBPVUcBvMp/NkXxtrCzbeBjYvrvUw0nwqBGy+8I0wd8JDmXbTl
         vOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786196318; x=1786801118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfZyWZCjJ1leqVfT0SG7I+7umcPy1TcL4EPeJOs9ZU8=;
        b=UIvbX3tnQ8JA39q+MDV/2nmeC8xhCnc3mkOEugCX/RNrCC9nlGxqMzID9dKUXOKsa1
         hSnF8YI3ZyrBxXaI1ppzO4Fm8k2jszh4OW3KWJJO2gBii0BH++dkdLSbTqq9PdsqEPm4
         svhs2LjnNLvfZsbKxL0mlUsi1A40SkMFl4RbuW9FZP2urKlbzmw+GNHHEXJHqI+WqGrx
         1x6YwVHOnt3XhHlRy5r0UpX3wzzvL1SU8A2vhL1PSlaGwX07+DFNqmI8ce1pbnTNph6d
         HQg3Op1WkZzvnDNWm3SwKPa8WwKQBAf8CMU4EZG8qCks1tqyrrJwdwLxufG0GW1hUcuv
         nXVg==
X-Forwarded-Encrypted: i=1; AHgh+RpHmnSEe+uxjQko+XROjIuqy8auuN40Y01mRhmaSa+n6JBEcWihtjGp6awvoeo3WnFVBd51Z1p4k8b37A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAtDuwoAa+4pXktU85/AQ5FBHdX16ssIf/nvRFL80VShrHUIHj
	E/oIMkSpwn/K97Q+1jfRF16r2bf0qASFzgZALK15OTTLhDGxKOE+2aBinMCGtoa7S2q+6dgMz5Y
	HICFOf7Zu0eUz02jq/OgInYOhsAjxuPQvy0jzlvlzEg==
X-Gm-Gg: AR+sD13CbuDGv2/4c88xn59n6FYy9MgSkAiHbggHXb4VH+bZMJfVd8qKjmnvyDMWW65
	8+jHewwp77KIadbw7/JLFHMhF4cur2zuT4K+920qtR4D/IpJ2BgcyxNyfFwhn2jBu6WD0oe+O3k
	zqMA7mKLdClAKg7H9joUg9lAA5yfAVTZKhIkcR4gwoImMB28xsz4o+1MFS+tsOPbTigFyKTj4hI
	fjnKu9BsdguYzS80BenzSuUC658X89YSuDmelKk7P5/VlkaDrgqzCxTwXjrFikPTiX9SI5hdsZG
	c9I/7Cry8eh+5T5DjQPy5ar418xoss+Yj6D5McBW4ZkEiQYUlOH8xbC1pu+U1yLt0qr3bWNhlvm
	mrUCZYoNcpeKSQkaVOK9pJamhAg9iNmTguGiIFduEMgJNb3gyveFEFjAh9K+Fk54=
X-Received: by 2002:a05:6000:1887:b0:47f:ec53:1d2d with SMTP id
 ffacd0b85a97d-481319549ddmr7552590f8f.7.1786196318049; Sat, 08 Aug 2026
 06:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260721073612.137259-1-xb@ultrarisc.com>
In-Reply-To: <20260721073612.137259-1-xb@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 8 Aug 2026 19:08:26 +0530
X-Gm-Features: AUfX_mzyJKN77fdCLGM6gmkcr4GuDsVCUAGD0eNJkavB7H9aI1HM5JR4BzibWXc
Message-ID: <CAAhSdy3kDmRxcT_+dOpcUVAkvZ-F0kWdQett+mTy93gPDkwS+Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
To: Xie Bo <xb@ultrarisc.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_063840_065359_27B51F42 
X-CRM114-Status: GOOD (  16.86  )
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

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgMTowNuKAr1BNIFhpZSBCbyA8eGJAdWx0cmFyaXNjLmNv
bT4gd3JvdGU6Cj4KPiBLVk0gZGV2aWNlIGlvY3RscyBhcmUgbm90IHNlcmlhbGl6ZWQgYWdhaW5z
dCBLVk1fUlVOLiBBcyBhIHJlc3VsdCwKPiBrdm1fcmlzY3ZfYWlhX2ltc2ljX3J3X2F0dHIoKSBj
YW4gc25hcHNob3QgdGhlIHBoeXNpY2FsIENQVSBhbmQgSEdFSSBvZgo+IGFuIElNU0lDIFZTLWZp
bGUgYmVmb3JlIGEgY29uY3VycmVudCB2Q1BVIG1pZ3JhdGlvbiByZWxlYXNlcyBpdC4KPgo+IFRo
ZSBIR0VJIGNhbiB0aGVuIGJlIGFsbG9jYXRlZCB0byBhbm90aGVyIHZDUFUgYmVmb3JlIGltc2lj
X3ZzZmlsZV9ydygpCj4gdXNlcyB0aGUgc3RhbGUgdHVwbGUuIEEgR0VUIG9yIFNFVCBhdHRyaWJ1
dGUgbWF5IGNvbnNlcXVlbnRseSBhY2Nlc3MgdGhlCj4gbmV3IG93bmVyJ3MgaW50ZXJydXB0IGZp
bGUuCj4KPiBTZXJpYWxpemUgdGhlIGVudGlyZSBJTVNJQyBhdHRyaWJ1dGUgb3BlcmF0aW9uIHdp
dGggdGhlIHRhcmdldCB2Q1BVCj4gbXV0ZXguIFRoaXMgcHJldmVudHMgdGhlIFZTLWZpbGUgZnJv
bSBiZWluZyBtaWdyYXRlZCBhbmQgcmVjeWNsZWQgdW50aWwKPiB0aGUgYXR0cmlidXRlIGFjY2Vz
cyBjb21wbGV0ZXMuCj4KPiBGaXhlczogZGI4YjdlOTdkNjEzICgiUklTQy1WOiBLVk06IEFkZCBp
bi1rZXJuZWwgdmlydHVhbGl6YXRpb24gb2YgQUlBIElNU0lDIikKPiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFhpZSBCbyA8eGJAdWx0cmFyaXNjLmNvbT4KClBs
ZWFzZSBhZGRyZXNzIHRoZSBuZXcgaXNzdWUgcmVwb3J0ZWQgYnkgU2FzaGlrbyBib3QKClJlZ2Fy
ZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIHwgMTAgKysrKysr
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9r
dm0vYWlhX2ltc2ljLmMKPiBpbmRleCBkMzhmNWRlMDguLjJhNGY4OGVmZSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9p
bXNpYy5jCj4gQEAgLTk2OSw5ICs5NjksMTMgQEAgaW50IGt2bV9yaXNjdl9haWFfaW1zaWNfcndf
YXR0cihzdHJ1Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcgdHlwZSwKPiAgICAgICAgIGlmICgh
dmNwdSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4KPiArICAgICAgIG11dGV4
X2xvY2soJnZjcHUtPm11dGV4KTsKPiArCj4gICAgICAgICBpbXNpYyA9IHZjcHUtPmFyY2guYWlh
X2NvbnRleHQuaW1zaWNfc3RhdGU7Cj4gLSAgICAgICBpZiAoIWltc2ljKQo+IC0gICAgICAgICAg
ICAgICByZXR1cm4gLUVOT0RFVjsKPiArICAgICAgIGlmICghaW1zaWMpIHsKPiArICAgICAgICAg
ICAgICAgcmMgPSAtRU5PREVWOwo+ICsgICAgICAgICAgICAgICBnb3RvIG91dF91bmxvY2s7Cj4g
KyAgICAgICB9Cj4gICAgICAgICBpc2VsID0gS1ZNX0RFVl9SSVNDVl9BSUFfSU1TSUNfR0VUX0lT
RUwodHlwZSk7Cj4KPiAgICAgICAgIHJlYWRfbG9ja19pcnFzYXZlKCZpbXNpYy0+dnNmaWxlX2xv
Y2ssIGZsYWdzKTsKPiBAQCAtOTk1LDYgKzk5OSw4IEBAIGludCBrdm1fcmlzY3ZfYWlhX2ltc2lj
X3J3X2F0dHIoc3RydWN0IGt2bSAqa3ZtLCB1bnNpZ25lZCBsb25nIHR5cGUsCj4gICAgICAgICAg
ICAgICAgIHJjID0gaW1zaWNfdnNmaWxlX3J3KHZzZmlsZV9oZ2VpLCB2c2ZpbGVfY3B1LCBpbXNp
Yy0+bnJfZWl4LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpc2VsLCB3
cml0ZSwgdmFsKTsKPgo+ICtvdXRfdW5sb2NrOgo+ICsgICAgICAgbXV0ZXhfdW5sb2NrKCZ2Y3B1
LT5tdXRleCk7Cj4gICAgICAgICByZXR1cm4gcmM7Cj4gIH0KPgo+IC0tCj4gMi41NC4wCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
