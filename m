From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 29 Oct 2018 12:26:32 -0700
Subject: [PATCH 0/2] Remove umoddi3 and udivmoddi4
Message-ID: <20181029192634.30078-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

These were only necessary for an out-of-tree driver that has since been
fixed to use the proper divide routines.
